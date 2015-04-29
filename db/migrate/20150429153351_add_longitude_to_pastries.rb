class AddLongitudeToPastries < ActiveRecord::Migration
  def change
    add_column :pastries, :longitude, :float
  end
end
