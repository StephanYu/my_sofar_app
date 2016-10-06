module VideoDecorator 

  def song_present?
    song.present? ? true : false
  end

  def thumb_present?
    thumb_url.present? ? true : false
  end
end