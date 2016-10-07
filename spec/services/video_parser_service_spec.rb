require "rails_helper"
require "video_parser_service"

describe VideoParserService do 
  describe '.get_videos' do 
    it 'fetches video data from AWS' do 
      let(:video_json_file) { }
      response = VideoParserService.get_videos(video_json_file)
      expect(response).to eq(video_json_file)
    end
  end

  describe '.get_thumbnail' do 
    before :each do 
      video     = Fabricate(:video)
      api_key   = ENV["youtube_api_key"]
      fields    = "items(id,snippet(thumbnails))"
      part      = "snippet"
    end
  
    it "fetches the video's thumbnail url from an API" do 
      response = VideoParserService.get_thumbnail(video)
      expect(response).to eq(video.thumb_url)
    end

    it "only returns a url when it is present" do 

    end
  end

  it 'sets all variables from the song, artist, and city keys if present'
  it 'checks to see if the new entry into the db is unique'
  it 'saves the artist, city, song, and video to the database'
end