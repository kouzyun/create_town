class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy

	enum category: { 参加者募集中！: 0, 考え事: 1, イベント開催します！: 2 },_suffix: true

	#geocoderがaddressカラムからlatitude,longitudeに自動的に反映させる
	geocoded_by :address
	after_validation :geocode

	validates :title, :body, length: {minimum: 5}
	validates :category, presence: :true
	validates :postal_code, format: { with: /\A\d{7}\z/ }, allow_blank: true
	validates :address, length: {minimum: 3}, allow_blank: true
end