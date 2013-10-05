class FollowedPerson < ActiveRecord::Base

  belongs_to :person
  belongs_to :followed_person, :class_name => "Person"
end