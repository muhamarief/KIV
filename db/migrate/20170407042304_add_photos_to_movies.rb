class AddPhotosToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :photos, :json
  end
end
