class CreateScreenings < ActiveRecord::Migration[5.0]
  def change
    create_table :screenings do |t|

      t.timestamps
    end
  end
end
