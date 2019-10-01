class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
  
    def initialize
        #@all_ratings = Movie.all_ratings
        #super
    end

    def show
        id = params[:id]
        @movie = Movie.find(id)
    end

      def index
         @movies = Movie.all
         @all_ratings = Movie.all_ratings
         @movies = Movie.order(params[:sort_by])
         @sort_column = params[:sort_by]
         #@selected_ratings 
        if(params[:ratings].nil? and session[:ratings].nil?)
          @selected_ratings = Movie.populated
        else
          @selected_ratings = params[:ratings] || session[:ratings]
        end
          end

    def new
        
    end

    def create
        @movie = Movie.create!(params[:movie])
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
    end

    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(params[:movie])
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

end
