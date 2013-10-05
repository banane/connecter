class CreateFollowedPeople < ActiveRecord::Migration
  def change
    create_table :followed_people do |t|
      t.integer :person_id
      t.integer :followed_person_id

      t.timestamps
    end
  end
end
