class ModifyPreparationAddressForPastries < ActiveRecord::Migration
  def change
    rename_column :pastries, :preparation_address, :pastry_address
  end
end
