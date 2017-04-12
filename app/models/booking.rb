class Booking < ApplicationRecord
  has_many :seats, through: :seat_bookings
  belongs_to :screening
  belongs_to :user
end
