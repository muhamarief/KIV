class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.string :trailer_url
      t.string :cast
      t.integer :rating
      t.time :duration

      t.timestamps
    end
  end
end
