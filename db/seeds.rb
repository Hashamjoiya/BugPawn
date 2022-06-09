# This is not the place for test data
# Only use this to put the necessary setup for the app to work
# Separate the seeds in different Seed Service Objects
# The data can then be loaded with the rails db:seed command

require 'faker'

User.create!(
  first_name: Faker::Name.first_name,
  email: 'admin@example.com',
  password: 'password123',
  password_confirmation: 'password123')

(980..990).each do |id|
  User.create!(
    id: id,
    first_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: 'password123',
    password_confirmation: 'password123',
  )
end

(980..1000).each do |id|
  Issue.create!(
    id: id,
    title: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.paragraphs(4).map{|pr| "<p>#{pr}</p>"}.join,
    label_list: [Faker::Color.color_name, Faker::Color.color_name],
    author_id: Faker::Number.between(from: 980, to: 990)
  )
end

(1..100).each do |id|
  Comment.create!(
    id: id,
    content: Faker::Lorem.paragraphs(4).map{|pr| "<p>#{pr}</p>"}.join,
    author_id: Faker::Number.between(from: 980, to: 990),
    issue_id: Faker::Number.between(from: 980, to: 990)
  )
end
