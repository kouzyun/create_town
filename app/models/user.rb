class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  enum user_status: { なにかしたいです！: 0, 参加者探してます！: 1},_suffix: true

  attachment :profile_image

  geocoded_by :address
  after_validation :geocode

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :interest, length: { minimum: 1 }, on: :update
  validates :introduction, length: {minimum: 1}, on: :update
  validates :user_status, presence: true, on: :update
  validates :postal_code, allow_nil: true, format: { with: /\A\d{7}\z/ }
  validates :address, allow_nil: true, length: { minimum: 2}

end