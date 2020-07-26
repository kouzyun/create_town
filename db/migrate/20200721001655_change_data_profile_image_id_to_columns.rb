class ChangeDataProfileImageIdToColumns < ActiveRecord::Migration[5.2]
  def change
  	change_column :columns, :column_image_id, :string
  end
end
