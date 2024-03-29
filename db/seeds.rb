# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting data"

Break.delete_all
Shift.delete_all
User.delete_all
Organisation.delete_all

puts "Seeding data"

3.times do
  organisation = Organisation.create(name: Faker::Restaurant.name, hourly_rate: rand(10..20))
  3.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456")
    shift = Shift.create(
      start: Faker::Time.backward(days: 1, period: :morning),
      finish: Faker::Time.backward(days: 1, period: :evening)
    )
    3.times do
      brk = Break.create(break_length: [0, 10, 20, 30, 40, 50, 60].sample)
      brk.shift = shift
      brk.save
    end
    shift.user = user
    shift.organisation = organisation
    user.organisation = organisation
    user.save
    shift.save
    organisation.save
    puts user.name
  end
  puts organisation.name
end

puts "Finished seeding"
