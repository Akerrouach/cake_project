class AddPreparationZipCodeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :preparation_zip_code, :string
  end
end
