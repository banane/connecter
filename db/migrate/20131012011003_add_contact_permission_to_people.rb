class AddContactPermissionToPeople < ActiveRecord::Migration
  def change
    add_column :people, :contact_permission, :boolean, :default => true
  end
end
