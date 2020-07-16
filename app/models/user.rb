class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #フォロー機能の多対多のリレーション設定
  has_many :follow, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy #フォローしているユーザーを取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワーを取得
    has_many :following_user, through: :follow, source: :followed #自分がフォローしているユーザーを取得
    has_many :follower_user, through: :followed, source: :followed #自分のフォロワーを取得


    #フォローする
    def following(user_id)
      follow.create(followed_id: user_id)
    end
    #アンフォローする
    def unfollow(user_id)
      follow.find_by(followed_id: user_id).destroy
    end

    #フォローしていればtrueを返す
    def following?(user)
      following_user.include?(user)
    end

  enum user_status: { なにかしたいです！: 0, 参加者探してます！: 1},_suffix: true

  attachment :profile_image

  geocoded_by :address
  after_validation :geocode

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :interest, length: { minimum: 1 }, on: :update
  validates :introduction, length: {minimum: 1}, on: :update
  validates :user_status, presence: true, on: :update
  validates :postal_code, format: { with: /\A\d{7}\z/ }, allow_blank: true
  validates :address, length: { minimum: 3}, allow_blank: true

end