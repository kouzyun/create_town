class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#ユーザーidがfavoritesテーブルに存在しているか調べる
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	enum category: { 参加者募集中！: 0, 考え事: 1, イベント開催します！: 2 },_suffix: true

	#geocoderがaddressカラムからlatitude,longitudeに自動的に反映させる
	geocoded_by :address
	after_validation :geocode

	#投稿キーワード検索機能
	def self.search(search)
		if search
			Post.where(['title LIKE ? OR body LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
		end
	end

	validates :title, :body, length: {minimum: 5}
	validates :category, presence: :true
	validates :postal_code, format: { with: /\A\d{7}\z/ }, allow_blank: true #郵便番号を整数7桁しか受け付けないように設定
	validates :address, length: {minimum: 3}, allow_blank: true
end