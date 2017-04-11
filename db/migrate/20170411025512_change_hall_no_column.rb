class ChangeHallNoColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :showplaces, :hall_no, :integer
    add_column :screenings, :hall_no, :integer
  end
end
