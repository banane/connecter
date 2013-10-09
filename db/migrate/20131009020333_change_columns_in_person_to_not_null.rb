class ChangeColumnsInPersonToNotNull < ActiveRecord::Migration
  def change
    change_column :people, :email, :string, :null => false
  end
end
