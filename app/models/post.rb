class Post < ApplicationRecord
	attachment :image

	enum category: { 参加者募集中: 0, 考え事: 1, イベント: 2 },_suffix: true
end
