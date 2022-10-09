class Group < ApplicationRecord
  
  belongs_to :user, optional: true
  has_many :group_users
  
  has_one_attached :group_image
  
  def get_group_image
    group_image.attached? ? group_image : 'no_image.jpg'
  end
  
  def group_user?(user)
    group_users.exists?(user_id: user.id)
  end
  
end
