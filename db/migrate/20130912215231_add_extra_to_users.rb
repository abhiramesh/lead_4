class AddExtraToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :debt, :string
  	add_column :users, :loan, :string
  end
end
