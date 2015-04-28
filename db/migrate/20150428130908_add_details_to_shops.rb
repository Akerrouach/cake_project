class AddDetailsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :preparation_address, :string
    add_column :shops, :longitude, :decimal
    add_column :shops, :latitude, :decimal
  end
end
