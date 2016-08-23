class User < ActiveRecord::Base
  # validates :name, presence: true
  # validates :email, presence :true, uniqueness :true
  has_many :notes

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
