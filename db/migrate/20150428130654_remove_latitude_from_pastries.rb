class RemoveLatitudeFromPastries < ActiveRecord::Migration
  def change
    remove_column :pastries, :latitude, :decimal
  end
end
