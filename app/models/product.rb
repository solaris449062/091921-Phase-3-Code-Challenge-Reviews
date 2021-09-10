class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(user: user, comment: comment, star_rating: star_rating, user_id: user.id, product_id: self.id)
    end

    def print_all_reviews
        puts self.reviews.map(&:print_review)
    end

    def average_rating
        ratings = self.reviews.map(&:star_rating)
        ratings.sum/ratings.size.to_f
    end

    
end