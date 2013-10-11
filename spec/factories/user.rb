require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "temporarypassword"
  end
end