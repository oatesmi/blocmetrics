# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

admin_user = User.create!(
  email: 'oatesmi.74@gmail.com',
  password: 'password'
)

10.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6)
  )
end

users = User.all

20.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lovecraft.deity,
    url: Faker::Internet.url
  )
end

applications = RegisteredApplication.all

1000.times do
  event = Event.create!(
    registered_application: applications.sample,
    name: Faker::Lovecraft.word
  )
  event.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

events = Event.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
