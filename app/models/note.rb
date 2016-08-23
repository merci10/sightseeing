class Note < ActiveRecord::Base
  # validates :image, presence :true
  # validates :content, length: {maximum: 140}
  # validates :user_id, presence :true
  belongs_to :user
end
