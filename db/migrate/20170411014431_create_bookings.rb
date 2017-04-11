class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :screening, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :paid_status, :default => false

      t.timestamps
    end
  end
end
