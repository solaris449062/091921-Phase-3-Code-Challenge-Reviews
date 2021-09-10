class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        max_rating = self.reviews.map(&:star_rating).max(1)
        # self.reviews
        # .filter {|review| review.star_rating == max_rating}
        # .map(&:product_id)
        
    end

    
    def remove_reviews(product)
        while self.reviews.find_by_user_id(self.id)
            review = self.reviews.find_by_user_id(self.id)
            review.destroy if review
        end
    end
end