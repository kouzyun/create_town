class RemovePostalCodeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :postal_code, :string
  end
end
