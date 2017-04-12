class EditBookingSeatColumns < ActiveRecord::Migration[5.0]
  def change
    remove_reference :seats, :booking, foreign_key: true
  end
end
