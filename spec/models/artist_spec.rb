require 'rails_helper'

describe Artist do 
  it { should validate_presence_of(:artist_uid) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:artist_uid) }
end