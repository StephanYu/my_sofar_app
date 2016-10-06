class Artist < ApplicationRecord
  has_many :songs
  
  validates :artist_uid, presence: true
  validates :title, presence: true
  validates_uniqueness_of :artist_uid
end
