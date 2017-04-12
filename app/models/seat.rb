class Seat < ApplicationRecord
  has_many :bookings, through: :seat_bookings
  belongs_to :screening, :dependent => :destroy

end
