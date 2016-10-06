require 'rails_helper'

describe "FetchVideoService" do

  it "returns a video file in JSON format with a status 200" do
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "returns a video object with the correct id" do 
    expect(response).to eq(video_uid)
  end
end