class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.string :row_number
      t.integer :seat_number
      t.boolean :booking_status, :default => false

      t.timestamps
    end
  end
end
