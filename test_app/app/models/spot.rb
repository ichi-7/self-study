class Spot < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :spot_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_image
    image.attached? ? image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
