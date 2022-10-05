class Spot < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :spot_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :spot_name, presence: true
  validates :image, presence: true
  
  def get_image
    image.attached? ? image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  #検索方法の分岐
  def self.looks(search,word)
    case search
    when "perfect_match"
      @spot = Spot.where("spot_name LIKE?", "#{word}")
    when "forward_match"
      @spot = Spot.where("spot_name LIKE?", "#{word}%")
    when "backward_match"
      @spot = Spot.where("spot_name LIKE?", "%#{word}")
    when "partial_match"
      @spot = Spot.where("spot_name LIKE?", "%#{word}%")
    else
      @spot = Spot.all
    end
  end
  
end
