class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email,   :null => false, :default => ""
      t.string :first_name, :default => ""
      t.string :last_name, :default => ""
      t.string :profile_photo
      t.string :role, :default => ""
      t.string :company, :default => ""
      t.string :location
      t.boolean :member, :default => false
      t.boolean :attending, :default => false
      t.text :keywords
      t.text :looking_for
      t.timestamps
    end
  end
end
