require 'factory_girl'

FactoryGirl.define do
  factory :followed_person do
    person_id 1
    followed_person_id 4
  end
end