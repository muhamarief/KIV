class AddColumnsToScreenings < ActiveRecord::Migration[5.0]
  def change
    add_column :screenings, :price, :integer
    add_column :screenings, :start_date, :date
    add_column :screenings, :start_time, :time
    add_reference :screenings, :showplace, foreign_key: true
  end
end
