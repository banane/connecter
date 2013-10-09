require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    date_of_birth { 21.years.ago }
  end
end