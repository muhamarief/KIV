class Screening < ApplicationRecord

  belongs_to :showplace, :dependent => :destroy
  belongs_to :movie
  belongs_to :cinema

  has_many :seats

  after_create :create_seats

  def create_seats
    rows = ("A".."R")
    nums = (1..18)
    rows.each do |row|
      nums.each do |num|
        Seat.create(screening_id: self.id, row_number: row, seat_number: num)
      end
    end
  end
end
