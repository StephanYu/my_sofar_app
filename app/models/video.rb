class Video < ApplicationRecord
  belongs_to :song

  validates :video_uid, presence: true
end
