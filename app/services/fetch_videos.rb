class FetchVideoService
  include HTTParty
  base_uri 'https://www.googleapis.com/youtube'
  format :json
  
  def initialize(video_uid, api_key, fields = nil, part = nil)
    @options = { query: {id: video_uid, key: api_key, fields: fields, part: part} }
  end

  def videos
    self.class.get("/v3/videos", @options)["items"]
  end
  
  # URL: https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=YOUR_API_KEY&fields=items(id,snippet(publishedAt,title,description,thumbnails),statistics)&part=snippet,statistics

  # Output

  # {
  #  "items": [
  #   {
  #    "id": "7lCDEYXw3mM",
  #    "snippet": {
  #     "publishedAt": "2012-06-20T23:12:38.000Z",
  #     "title": "Google I/O 101: Q&A On Using Google APIs",
  #     "description": "Antonio Fuentes speaks to us and takes questions on working with Google APIs and OAuth 2.0.",
  #     "thumbnails": {
  #      "default": {
  #       "url": "https://i.ytimg.com/vi/7lCDEYXw3mM/default.jpg",
  #       "width": 120,
  #       "height": 90
  #      }
  #     }
  #    },
  #    "statistics": {
  #     "viewCount": "7287",
  #     "likeCount": "40",
  #     "dislikeCount": "2",
  #     "favoriteCount": "0",
  #     "commentCount": "3"
  #    }
  #   }
  #  ]
  # }
end