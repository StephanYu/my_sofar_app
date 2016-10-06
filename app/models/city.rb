class City < ApplicationRecord
  has_many :songs

  validates :city_uid, presence: true   
  validates :title, presence: true
  validates_uniqueness_of :city_uid
end
