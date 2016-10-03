class SongsController < ApplicationController

  def index
    @videos = Video.includes(:songs).all
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
      video      = FetchVideoService.new(video_uid, api_key, fields, part).videos.first

      statistics = video["statistics"]
    end

    def set_video
      @video = Song.find(song_params).video
    end

    def song_params
      params.require(:song).permit(:song_uid)
    end
end
