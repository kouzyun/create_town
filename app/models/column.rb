class Column < ApplicationRecord
	belongs_to :user

	attachment :column_image

	#コラム検索機能
	def self.search(search)
		Column.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
	end

	validates :title, length: { minimum: 1, maximum: 100 }
	validates :body , length: { minimum: 1, maximum: 1000 }
	validates :column_image, presence: :true
end
