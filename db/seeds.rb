# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleteting data"

Organisation.delete_all

puts "Seeding data"

3.times do
  organisation = Organisation.new(name: Faker::Restaurant.name , hourly_rate: rand(10..20))
  puts organisation.name
end

puts "Finished seeding"
