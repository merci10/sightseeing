module ApplicationHelper
  def current_user?(user)
    current_user.id == user.id
  end

  def gmaps_markers(hash)
    @hash = Gmaps4rails.build_markers(hash) do |h, marker|
      marker.lat h.latitude
      marker.lng h.longitude
      marker.infowindow h.title
    end
  end
end
