class RemoveLongitudeFromPastries < ActiveRecord::Migration
  def change
    remove_column :pastries, :longitude, :decimal
  end
end
