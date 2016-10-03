require 'rails_helper'

describe City do 
  it { should have_many(:songs) }

  it { should validate_presence_of(:city_uid) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:city_uid) }
end