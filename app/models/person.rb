class Person < ActiveRecord::Base
  has_many :followed_people
  has_many :people, :through => :followed_people
  has_many :inverse_followed_people, :class_name => "FollowedPeople", :foreign_key => "person_id"
  has_many :inverse_followed_people, :through => :inverse_followed_people, :source => :person

  searchable do
    text :keywords, :company, :role, :last_name, :email
  end

  def is_following person_id
    self.followed_people.where(:followed_person_id => person_id).size > 0
  end

end
