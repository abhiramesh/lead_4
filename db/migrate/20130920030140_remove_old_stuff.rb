class RemoveOldStuff < ActiveRecord::Migration
  def up
  	remove_column :users, :age
  	remove_column :users, :employment
  	remove_column :users, :attorney
  	remove_column :users, :medical
  	remove_column :users, :desc
  	remove_column :users, :debt
  	remove_column :users, :loan
  end

  def down
  end
end
