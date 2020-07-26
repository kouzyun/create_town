class RenameLatidudeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :latidude, :latitude
  end
end
