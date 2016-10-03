class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :city
  belongs_to :video

  validates_presence_of   :song_uid
  validates_presence_of   :title
  validates_uniqueness_of :song_uid
end
