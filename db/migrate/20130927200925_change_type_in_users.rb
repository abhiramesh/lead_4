class ChangeTypeInUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :type
  	add_column :users, :proptype, :string
  end

  def down
  end
end
