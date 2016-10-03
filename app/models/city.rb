class City < ApplicationRecord
  has_many :songs

  validates_presence_of   :city_uid
  validates_presence_of   :title
  validates_uniqueness_of :city_uid
end
