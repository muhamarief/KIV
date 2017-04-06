class CreateCinemaMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :showplaces do |t|
      t.references :cinema, index: true
      t.references :movie, index: true
      t.string :hall_no

      t.timestamps
    end
  end
end
