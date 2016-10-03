class Artist < ApplicationRecord
  has_many :songs
  
  validates_presence_of   :artist_uid
  validates_presence_of   :title
  validates_uniqueness_of :artist_uid
end
