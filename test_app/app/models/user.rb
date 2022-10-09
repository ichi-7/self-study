class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spots, dependent: :destroy
  has_many :spot_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  #一覧画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  #グループ機能
  has_many :groups, dependent: :destroy
  has_many :group_users, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image
    profile_image.attached? ? profile_image : 'no_image_avatar.jpg'
  end
  
  #フォローする際の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  #フォローを外す際の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  #フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  #検索方法の分岐
  def self.looks(search,word)
    case search
    when "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    when "forward_match"
      @user = User.where("name LIKE?", "#{word}%")
    when "backward_match"
      @user = User.where("name LIKE?", "%#{word}")
    when "partical_match"
      @user = User.where("name LIKE", "%#{word}%")
    else
      @user = User.all
    end
  end
  
end
