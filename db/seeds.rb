# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleteting data"

User.delete_all
Organisation.delete_all

puts "Seeding data"

3.times do
  organisation = Organisation.create(name: Faker::Restaurant.name, hourly_rate: rand(10..20))
  3.times do
    shift = Shift.create(shift_date: Faker::Date.in_date_period.strftime("%m/%d/%Y"), start: "10:30am", finish: "14:30pm")
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456")
    shift.user = shift
    user.organisation = organisation
    puts user.name
  end
  puts organisation.name
end

puts "Finished seeding"
