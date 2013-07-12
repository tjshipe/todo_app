require 'faker'

# create a few users
User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
end

5.times do
  User.first.lists.create name: Faker::Lorem.word
end

5.times do
  User.first.lists.first.tasks.create name: Faker::Lorem.word
end
