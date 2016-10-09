class VideoImporterService
  
  def process(videos, api_key, fields, part)
    videos.all.map do |video|
      video_uid      = video['video_uid']
      youtube_video  = FetchVideoService.new(video_uid, api_key, fields, part).videos.first 
      thumbnail_url  = get_thumbnail(youtube_video)

      create_video(video)

      #todo: persist to database if not already existent

    end
  end

  private
    def get_thumbnail(video)
      video['snippet']['thumbnails']['medium']['url'] if video.present?
    end

    def build_song(song_hash)
      song = Song.find_by(song_uid: song_hash['id'])
      return song unless song.nil?
      Song.new(
          song_uid:    song_uid, 
          artist:   build_artist(song_hash['artist']), 
          title:       song_title, 
          cached_slug: song_slug, 
          city:     build_city(song_hash['city']))
      end
    end

    def build_artist(uid)

    end

    def build_city(uid)

    end

    def create_video(video)
      # create Video object
      video_obj = Video.new
      video_obj.song = build_song(video['song'])
      # Video.save

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
      # todo: create hash object with all variables set as keys
      return {}
    end
end