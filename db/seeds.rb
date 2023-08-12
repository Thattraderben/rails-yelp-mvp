# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# First, you might want to clear existing data:
Restaurant.destroy_all
puts 'destroying all previous restaurants...'

# Example to create 10 restaurants
puts 'creating 5 new restaurants...'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )

  # Optionally, you could also create associated reviews for each restaurant
  # Example to create 3 reviews for each restaurant:
  3.times do
    restaurant.reviews.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
end
