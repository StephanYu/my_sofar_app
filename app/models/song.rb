class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :city
  has_one :video

  validates :song_uid, presence: true
  validates :title, presence: true
  validates_uniqueness_of :song_uid
end
