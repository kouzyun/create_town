class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  enum user_status: { なにかしたい: 0, 参加者募集中: 1},_suffix: true

  attachment :profile_image

  geocoded_by :address
	after_validation :geocode
end
