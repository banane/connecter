class AddProfilePhotoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :profile_photo, :string
  end
end
