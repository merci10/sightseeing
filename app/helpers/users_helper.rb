module UsersHelper
  def image_for(user)
    if user.image
      image_tag "/user_images/#{user.image}", class: "user-image"
    else
      image_tag "雪猫.JPG", class: "user-image"
    end
  end
end
