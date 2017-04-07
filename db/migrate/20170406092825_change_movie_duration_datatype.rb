class ChangeMovieDurationDatatype < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :duration, :time
    add_column :movies, :duration, :integer
  end
end
