class Parser

  def initialize(file)
    @file = file
  end

  def parse
    # read file JSON 
    videos = File.read("../../video_data.json")
    # parse data and save into db
      # iterate over array of objects
    videos.map do |video|
      #set variables
      @uid             = video['video_uid']
      @song_uid        = video['song']['id']
      @song_artist_uid = video['song']['artist_id']
      @song_title      = video['song']['title']
      @song_slug       = video['song']['cached_slug']
      @song_city_uid   = video['song']['city_id']
      @artist_uid      = video['artist']['id']
      @artist_title    = video['artist']['title']
      @artist_slug     = video['artist']['cached_slug']
      @city_uid        = video['id']
      @city_title      = video['city']['title']
      @city_slug       = video['city']['cached_slug']

    end

  end
end