class AddOtherStuff < ActiveRecord::Migration
  def up
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :electric, :string
  end

  def down
  end
end
