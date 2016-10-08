class VideosController < ApplicationController
   
  def index
    @videos = Video.includes(song: [:artist, :city]).paginate(:page => params[:page], :per_page => 12)
  end

  def show
    set_video
    statistics = fetch_video_statistics
    set_video_statistics(statistics)
  end


  private
    def fetch_video_statistics      
      video_uid  = @video.video_uid
      api_key    = ENV["youtube_api_key"]
      part       = "statistics"
      video      = FetchVideoService.new(video_uid, api_key, nil, part).videos.first

      video["statistics"]
    end

    def set_video_statistics(stats)
      @video_views = stats['viewCount']
      @video_likes = stats['likeCount'] 
      @video_dislikes = stats['dislikeCount'] 
      @video_favorites = stats['favoriteCount'] 
      @video_comments = stats['commentCount'] 
    end

    def set_video
      @video = Song.find(params[:id]).video
    end
end
