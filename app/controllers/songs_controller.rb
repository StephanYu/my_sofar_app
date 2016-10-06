class SongsController < ApplicationController

  def index
    @videos = Video.includes(:song).all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    set_video
    @video_stats = fetch_video_statistics
  end


  private
    def fetch_video_statistics      
      video_uid  = @video.video_uid
      api_key    = ENV["youtube_api_key"]
      part       = "statistics"
      video      = FetchVideoService.new(video_uid, api_key, nil, part).videos.first

      statistics = video["statistics"]
    end

    def set_video
      @video = Song.find(params[:id]).video
    end
end
