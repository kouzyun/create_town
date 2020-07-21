class AddColumnImageIdToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :column_image_id, :integer
  end
end
