class Post < ApplicationRecord
	belongs_to :user
	attachment :image

	enum category: { 参加者募集中: 0, 考え事: 1, イベント: 2 },_suffix: true

	#geocoderがaddressカラムからlatitude,longitudeに自動的に反映させる
	geocoded_by :address
	after_validation :geocode
end