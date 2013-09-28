class Person < ActiveRecord::Base
  searchable do
    text :keywords, :company, :role, :last_name, :email
  end
end
