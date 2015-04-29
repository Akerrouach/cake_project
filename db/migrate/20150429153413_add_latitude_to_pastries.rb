class AddLatitudeToPastries < ActiveRecord::Migration
  def change
    add_column :pastries, :latitude, :float
  end
end
