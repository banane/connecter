class Person < ActiveRecord::Base
  has_many :followed_people
  has_many :people, :through => :followed_people
  has_many :inverse_followed_people, :class_name => "FollowedPeople", :foreign_key => "person_id"
  has_many :inverse_followed_people, :through => :inverse_followed_people, :source => :person

  scope :attending, -> { where(:attending => 1).includes(:followed_people) }

  searchable do
    text :keywords, :company, :role, :last_name, :email
  end

  def is_following person_id
    self.followed_people.where(:followed_person_id => person_id).size > 0
  end

  def get_image
    if self.profile_photo.present?
      self.profile_photo
    else
      "placeholder.png"
    end
  end

end
