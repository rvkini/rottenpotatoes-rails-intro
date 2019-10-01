class Movie < ActiveRecord::Base
        @@all_ratings
        def self.all_ratings
            #self.find(:all, :select => "rating", :group => "rating").map(&:rating)
            @@all_ratings = ['G', 'PG', 'PG-13', 'R']
        end
        def self.populated
            return {'G'=>'1', 'PG'=>'1', 'PG-13'=>'1', 'R'=>'1'}
        end
end
