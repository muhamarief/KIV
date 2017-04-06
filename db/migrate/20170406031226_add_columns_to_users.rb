class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :city, :string
    add_reference :roles, :reference, index: true
  end
end
