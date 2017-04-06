class CreateCinemas < ActiveRecord::Migration[5.0]
  def change
    create_table :cinemas do |t|
      t.string :cinema_name
      t.string :contact
      t.string :address
      t.string :state
      t.string :company
      t.float :latitude, null: false
      t.float :longitude, null: false

     t.timestamps
    end
  end
end
