class AddLookingForToPerson < ActiveRecord::Migration
  def change
    add_column :people, :looking_for, :string
  end
end
