class Note < ActiveRecord::Base
  # validates :image, presence :true
  # validates :content, presence :true, length: {maximum: 140}
  # validates :user_id, presence :true
  belongs_to :user
end
