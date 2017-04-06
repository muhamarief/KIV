class Cinema < ApplicationRecord
  has_many :showplaces
  has_many :movies, through: :showplaces

  validates :latitude, :longitude, presence: true
  
end
