class VideosController < ApplicationController
   before_action :set_video, only: [:show]
   before_action :set_video_credentials, only: [:show, :youtube]

  def index
    @videos = Video.includes(song: [:artist, :city]).paginate(:page => params[:page], :per_page => 12)
  end

  def show
    create_video_profile(@video)
  end

  def youtube
    @video = Video.find(params[:id])
    create_video_profile(@video)
  end

  private

  def fetch_video(video_uid, api_key)
    fields = 'items(id,snippet(publishedAt,description,title),statistics)'
    part = 'snippet,statistics'
    video = FetchVideoService.new(video_uid, api_key, fields, part).videos.first

    video
  end

  def create_video_profile(video)
    result = fetch_video(video.video_uid, @api_key)
    snippet = result['snippet']
    statistics = result['statistics']
    
    set_video_snippet(snippet)
    set_video_statistics(statistics)
  end

  def set_video_credentials
    @api_key = ENV['youtube_api_key']
  end

  def set_video_statistics(stats)
    @video_views = stats['viewCount']
    @video_likes = stats['likeCount'] 
    @video_dislikes = stats['dislikeCount'] 
    @video_favorites = stats['favoriteCount'] 
    @video_comments = stats['commentCount'] 
  end

  def set_video_snippet(stats)
    @video_description = stats['description']
    @video_published_at = stats['publishedAt']
    @video_title = stats['title']
  end

  def set_video
    @video = Song.find(params[:id]).video
  end
end
