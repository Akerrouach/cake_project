class AddPreparationCityToShops < ActiveRecord::Migration
  def change
    add_column :shops, :preparation_city, :string
  end
end
