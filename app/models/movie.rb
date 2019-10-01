class Movie < ActiveRecord::Base
    class Movie < ActiveRecord::Base
        def self.all_ratings
            self.find(:all, :select => "rating", :group => "rating").map(&:rating)
        end
    end
end
