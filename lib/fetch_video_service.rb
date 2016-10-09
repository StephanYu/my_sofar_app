class FetchVideoService
  include HTTParty
  base_uri 'https://www.googleapis.com/youtube'
  format :json
  
  def initialize(video_uid, api_key, fields = nil, part = nil)
    @options = { query: {id: video_uid, key: api_key, fields: fields, part: part}.compact }
  end

  def videos
    self.class.get('/v3/videos', @options)['items']
  end
end