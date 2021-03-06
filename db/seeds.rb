# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create one user
User.create!(name: "Example User",
             email: "fake@example.com",
             password:  "password",
             password_confirmation:  "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             summoner_name: Faker::Team.creature)


# Create 99 more users
99.times do |n|
  name = Faker::Name.name
  summoner = Faker::Team.creature
  email = "fake-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation:  password,
               activated: true,
               activated_at: Time.zone.now,
               summoner_name: summoner)
end
