class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	#閲覧回数をカウントできるように設定
	is_impressionable counter_cache: true

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
			Post.where(['title LIKE ? OsR body LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
		end
	end

	validates :title, :body, :image, :address, presence: true
end