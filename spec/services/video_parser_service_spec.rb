require "rails_helper"
require "video_parser_service"

describe VideoParserService do
  describe '.parse' do 
    context 'available in data file' do 
      it 'declares variables for all resources'
    end

    context 'resource already present in db' do 
      it 'does not create a new entry' do 

      end
    end
  end

  describe '.get_thumbnail' do 
    before :each do 
      video     = Fabricate(:video)
      api_key   = ENV["youtube_api_key"]
      fields    = "items(id,snippet(thumbnails))"
      part      = "snippet"
    end
    context 'the video file has a thumbnail url' do 
      it "sets the thumbnail url" do 
        response = VideoParserService.get_thumbnail(video)
        expect(response).to eq(video.thumb_url)
      end

      it "returns a url" do 

      end
    end
    context 'the video file has no thumbnail' do 

    end
  end
end