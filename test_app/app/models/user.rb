class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spots, dependent: :destroy
  has_many :spot_comments, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image
    profile_image.attached? ? profile_image : 'no_image_avatar.jpg'
  end
  
end
