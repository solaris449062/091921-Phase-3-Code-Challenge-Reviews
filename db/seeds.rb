# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here

review1 = Review.create(comment: "Very good product", star_rating: 5, user_id: user1.id, product_id: product1.id)
review2 = Review.create(comment: "nice product", star_rating: 4, user_id: user2.id, product_id: product1.id)
review3 = Review.create(comment: "not a very good product", star_rating: 2, user_id: user3.id, product_id: product4.id)
review4 = Review.create(comment: "broke down after 1 month", star_rating: 2, user_id: user1.id, product_id: product1.id)


puts "Seeding done!"
puts
puts "Review#user for review1:"
puts review1.user.name
puts "Review#product for review1:"
puts review1.product.name

puts
puts "Product#reviews:"
puts product1.reviews.map(&:comment)
puts "Product#users:"
puts product1.users.map(&:name)

puts
puts "User#reviews:"
puts user1.reviews.map(&:comment)
puts "User#products:"
puts user1.products.map(&:name)

puts
puts "Review#print_review"
review1.print_review

puts
puts "Product#leave_review(user, star_rating, comment)"
new_review = product1.leave_review(user3, 3, "okay product")
puts "review by: " + new_review.user.name
puts new_review.star_rating
puts new_review.comment

puts
puts "Product#print_all_reviews"
product1.print_all_reviews

puts
puts "Product#average_rating"
puts product1.average_rating

puts
puts "Product#average_rating"
puts product1.average_rating

puts
puts "User#favorite_product"
puts user1.favorite_product

puts
puts "User#remove_reviews(product)"
user1.remove_reviews(product1)