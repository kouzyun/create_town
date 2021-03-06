class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#ユーザーidがfavoritesテーブルに存在しているか調べる(いいねしているか調べる)
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	#geocoderがaddressカラムからlatitude,longitudeに自動的に反映させる
	geocoded_by :address
	after_validation :geocode

	#プロジェクト検索機能
	def self.search(search)
		if search
			Post.where(['title LIKE ? OR body LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
		end
	end

	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: true
	validates :address, presence: true
end