class Showplace < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema
  has_many :screenings
end
