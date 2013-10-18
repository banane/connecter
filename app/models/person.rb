class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :token_authenticatable,
  #:confirmable,
         :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :lockable, :timeoutable and :omniauthable

#  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role, :company, :keywords, :looking_for, :location, :profile_photo, :attending, :member, :contact_permission

  has_many :followed_people
#  has_many :people, :through => :followed_people
#  has_many :inverse_followed_people, :class_name => "FollowedPeople", :foreign_key => "person_id"
#  has_many :inverse_followed_people, :through => :inverse_followed_people, :source => :person

  validates_presence_of :email

  scope :all_attending, -> { where(:attending => 1).includes(:followed_people)}

  searchable do
    text :keywords
    text :first_name
    text :last_name
    text :role
    text :company
    text :location
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
