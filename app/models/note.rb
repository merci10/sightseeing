class Note < ActiveRecord::Base
  # validates :image, presence :true
  # validates :content, length: {maximum: 140}
  # validates :user_id, presence :true
  belongs_to :user

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
