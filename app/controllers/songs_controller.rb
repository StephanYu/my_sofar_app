class SongsController < ApplicationController
  attr_reader :video, :video_views, :video_likes, :video_dislikes, :video_favorites, :video_comments
   
  def index
    @videos = Video.includes(:song).all.paginate(:page => params[:page], :per_page => 12)
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
      stats.each do |stat|
        @video_views     = stat if stat === 'viewCount'
        @video_likes     = stat if stat === 'likeCount'
        @video_dislikes  = stat if stat === 'dislikeCount'
        @video_favorites = stat if stat === 'favoriteCount'
        @video_comments  = stat if stat === 'commentCount'
      end
    end

    def set_video
      @video = Song.find(params[:id]).video
    end
end
