class AddSolarToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :appointment, :text
  	add_column :users, :time_zone, :string
  	add_column :users, :best_time, :string
  	add_column :users, :assist, :string
  	add_column :users, :credit, :string
  	add_column :users, :type, :string
  	add_column :users, :status, :string
  	add_column :users, :length, :string
  	add_column :users, :roof, :string
  end
end
