class AddPhotosToCinemas < ActiveRecord::Migration[5.0]
  def change
    add_column :cinemas, :photos, :json
  end
end
