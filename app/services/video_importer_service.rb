class VideoImporterService
  attr_reader :videos

  def initialize(videos)
    @videos = videos
  end

  def process(videos, api_key, fields, part)
    # TODO: change back to videos.all once testing is complete
    videos.sample(100).map do |video|
      video_uid      = video['video_uid']
      youtube_video  = FetchVideoService.new(video_uid, api_key, fields, part).videos.first 
      thumbnail_url  = get_thumbnail(youtube_video)

      create_video(video)
    end
  end

  private
  # TODO: set correct variables for Song, Artist, City
  
  def get_thumbnail(video)
    video['snippet']['thumbnails']['medium']['url'] if video.present?
  end

  def build_song(song_hash)
    song = Song.find_by(song_uid: song_hash['id'])
    return song unless song.nil?
    Song.new(
      song_uid:    song_uid, 
      artist:      build_artist(song_hash['artist']), 
      title:       song_title, 
      cached_slug: song_slug, 
      city:        build_city(song_hash['city']))
  end

  def build_artist(artist_hash)
    artist = Artist.find_by(artist_uid: artist_hash['id'])
    return artist unless artist.nil?
    Artist.new(
      artist_uid:  song_artist_uid, 
      title:       artist_title, 
      cached_slug: artist_slug)
  end

  def build_city(city_hash)
    city = City.find_by(city_uid: city_hash['id'])
    return city unless city.nil?
    City.new(
      city_uid:    song_city_uid, 
      title:       city_title, 
      cached_slug: city_slug)
  end

  def create_video(video)
    video_obj = Video.new
    video_obj.song = build_song(video['song'])
    video_obj.save
  end
end