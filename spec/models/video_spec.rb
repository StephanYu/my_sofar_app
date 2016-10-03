require 'rails_helper'

describe Video do 
  it { should belong_to(:song) }

  it { should validate_presence_of(:video_uid) }
end