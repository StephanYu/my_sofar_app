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
  
  def thumbnail
    if song.present? && thumb_url.present?
      link_to video_path(id: id, cached_slug: song.cached_slug), class: 'video_link' do
        image_tag("#{thumb_url}", height: '280', width: '320', alt: 'a video link')
      end
    elsif song.present?
      link_to video_path(id: id, cached_slug: song.cached_slug), class: 'video_link' do
          image_tag("no_image.png", height: '280', width: '320', alt: 'an image placeholder')
      end
    else
      link_to youtube_path(id: id), class: 'video_link' do
        image_tag("#{thumb_url}", height: '280', width: '320', alt: 'a video link')
      end
    end
  end
end
