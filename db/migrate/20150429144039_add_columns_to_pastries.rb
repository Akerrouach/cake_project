class AddColumnsToPastries < ActiveRecord::Migration
  def change
    add_column :pastries, :pastry_city, :string
    add_column :pastries, :pastry_zip_code, :string
  end
end
