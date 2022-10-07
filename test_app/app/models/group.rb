class Group < ApplicationRecord
  
  belongs_to :user, optional: true
  
  has_one_attached :group_image
  
  def get_group_image
    group_image.attached? ? group_image : 'no_image.jpg'
  end
  
end
