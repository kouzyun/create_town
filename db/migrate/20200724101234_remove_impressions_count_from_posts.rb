class RemoveImpressionsCountFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :impressions_count, :integer
  end
end
