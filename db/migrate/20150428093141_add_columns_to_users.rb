class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :description, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :pastrycook_confirmed_at, :datetime
    add_column :users, :pastrycook, :boolean, default: false
    add_attachment :users, :picture
  end
end
