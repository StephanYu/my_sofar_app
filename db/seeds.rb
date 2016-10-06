
videos    = AWS.download "video_data.json"
api_key   = ENV["youtube_api_key"]
fields    = "items(id,snippet(thumbnails))"
part      = "snippet"

videos.all.map do |video|
  video_uid         = video['video_uid']
  youtube_video     = FetchVideoService.new(video_uid, api_key, fields, part).videos.first 
  thumbnail_url     = youtube_video["snippet"]["thumbnails"]["medium"]["url"] if youtube_video.present?
  

  if video['song'].present?
    song   = video['song']
    artist = song['artist']
    city   = song['city']

    song_uid        = song['id']
    song_artist_uid = song['artist_id']
    song_title      = song['title']
    song_slug       = song['cached_slug']
    song_city_uid   = song['city_id']

    if artist.present?
      artist_title  = artist['title']
      artist_slug   = artist['cached_slug']
    end

    if city.present?
      city_title    = city['title']
      city_slug     = city['cached_slug']
    end
  end
  

  artist = Artist.find_by(artist_uid: song_artist_uid)
  if artist.nil?
    artist = Artist.create(
      artist_uid:  song_artist_uid, 
      title:       artist_title, 
      cached_slug: artist_slug)
  end

  city = City.find_by(city_uid: song_city_uid)
  if city.nil?
    city = City.create(
      city_uid:    song_city_uid, 
      title:       city_title, 
      cached_slug: city_slug)
  end

  song = Song.find_by(song_uid: song_uid)
  if song.nil?
    song = Song.create(
      song_uid:    song_uid, 
      artist_id:   artist.id, 
      title:       song_title, 
      cached_slug: song_slug, 
      city_id:     city.id)
  end

  video = Video.find_by(video_uid: video_uid)
  if video.nil?
    Video.create(
      video_uid:   video_uid, 
      thumb_url:   thumbnail_url, 
      song_id:     song.id)
  end
end
