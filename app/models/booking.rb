class Booking < ApplicationRecord
  has_many :seat_bookings
  has_many :seats, through: :seat_bookings
  belongs_to :screening
  belongs_to :user

  def set_total_price(user_seats)
    total = 0
    user_seats.each do |x|
      total += x.screening.price
    end
    self.total_price = total
    self.save
  end

end
