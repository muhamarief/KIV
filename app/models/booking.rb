class Booking < ApplicationRecord
  has_many :seats
  belongs_to :screening
  belongs_to :user
end
