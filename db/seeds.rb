
videos    = AWS.download "video_data.json"
api_key   = ENV["youtube_api_key"]
fields    = "items(id,snippet(thumbnails))"
part      = "snippet"

binding.pry
videos.map do |video|
  video_uid         = video['video_uid']
  youtube_video     = FetchVideoService.new(video_uid, api_key, fields, part).videos.first
  thumbnail_url     = youtube_video["snippet"]["thumbnails"]["medium"]["url"]

  if video['song'].present?
    song_uid        = video['song']['id']
    song_artist_uid = video['song']['artist_id']
    song_title      = video['song']['title']
    song_slug       = video['song']['cached_slug']
    song_city_uid   = video['song']['city_id']
  end
  
  if video['artist'].present?
    artist_title    = video['artist']['title']
    artist_slug     = video['artist']['cached_slug']
  end

  if video['city'].present?
    city_title      = video['city']['title']
    city_slug       = video['city']['cached_slug']
  end

  artist = Artist.find_by(artist_uid: song_artist_uid)
  if artist.nil?
    Artist.create(
      artist_uid:  song_artist_uid, 
      title:       artist_title, 
      cached_slug: artist_slug)
  end

  city = City.find_by(city_uid: song_city_uid)
  if city.nil?
    City.create(
      city_uid:    song_city_uid, 
      title:       city_title, 
      cached_slug: city_slug)
  end

  Song.create(
    song_uid:    song_uid, 
    artist_id:   song_artist_uid, 
    title:       song_title, 
    cached_slug: song_slug, 
    city_id:     song_city_uid)

  Video.create(
    video_uid:   video_uid, 
    thumb_url:   thumbnail_url, 
    song_id:     song_uid)
end
