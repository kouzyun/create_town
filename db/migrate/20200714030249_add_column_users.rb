class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :longitude, :float

  	add_column :users, :latidude, :float
  end
end
