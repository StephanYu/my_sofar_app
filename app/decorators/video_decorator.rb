module VideoDecorator 

  def song_present?
    song.present? ? true : false
  end

  def thumb_present?
    thumb_url.present? ? true : false
  end

  def song_title
    song.title
  end

  def artist_title
    song.artist.title
  end

  def city_title
    song.city.title
  end
end