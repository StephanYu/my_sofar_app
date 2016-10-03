class Video < ApplicationRecord
  belongs_to :song

  validates_presence_of :video_uid
end
