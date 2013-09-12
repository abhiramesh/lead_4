class AddQualifiedToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :qualified, :boolean
  end
end
