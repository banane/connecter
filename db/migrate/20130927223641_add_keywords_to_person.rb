class AddKeywordsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :keywords, :text
  end
end
