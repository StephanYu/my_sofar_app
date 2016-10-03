require 'rails_helper'

describe Song do 
  it { should belong_to(:artist) }
  it { should belong_to(:city) }
  it { should belong_to(:video) }

  it { should validate_presence_of(:song_uid) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:song_uid) }
end