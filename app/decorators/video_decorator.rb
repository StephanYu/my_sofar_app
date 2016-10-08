module VideoDecorator 

  def song_title
    song.title
  end

  def artist_title
    song.artist.title
  end

  def city_title
    song.city.title
  end

  #replace if else conditional block in index page 
  #if song present -> show link_to/tag
    # if thumb url present -> show image_tag
    # else show default image_tag
  #else show image_tag
  def video_thumbnail
    if song.present?
      if thumb.present?
        link_to image_tag("#{video.thumb_url}"), {action: 'show', controller: 'videos'}, {height: '280', width: '320', alt: 'a video link', class: 'a class'}
      else

      end
    else

    end
  end
end