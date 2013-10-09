require 'factory_girl'

FactoryGirl.define do
  factory :person do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    keywords Faker::Lorem.words(3)
    company Faker::Lorem.words(2)

  end
end