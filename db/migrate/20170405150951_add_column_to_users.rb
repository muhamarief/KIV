class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :gender, :integer
    add_column :users, :birthday, :date
    add_column :users, :phone_number, :string
    add_column :users, :role, :integer, :default => 0
  end
end
