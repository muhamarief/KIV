class AddColumnsToSeats < ActiveRecord::Migration[5.0]
  def change
    add_reference :seats, :booking, foreign_key: true
    add_reference :seats, :screening, foreign_key: true
  end
end
