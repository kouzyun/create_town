class Column < ApplicationRecord
	belongs_to :user

	attachment :column_image

	#コラム検索機能
	def self.search(search)
		Column.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
	end
end
