class Screening < ApplicationRecord

  belongs_to :showplace
  after_create :create_seats, if: => :new_record?

  def create_seats
    if self.hall_no.odd?
      rows = ("A".."E")
      nums = (1..10)
      rows.each do |row|
        nums.each do |num|
          Seat.create(screening_id: self.id, row_number: row, seat_number: num)
        end
      end
    elsif self.hall_no.even?
      rows = ("A".."G")
      nums = (1..12)
      other_nums = (4..9)
      rows.each do |row|
        if (row == "F") || (row == "G")
          nums.each do |num|
            Seat.create(screening_id: self.id, row_number: row, seat_number: num)
          end
        else
          other_nums.each do |num|
            Seat.create(screening_id: self.id, row_number: row, seat_number: num)
          end
        end
      end
    end
  end
end
