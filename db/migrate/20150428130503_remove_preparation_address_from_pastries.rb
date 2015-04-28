class RemovePreparationAddressFromPastries < ActiveRecord::Migration
  def change
    remove_column :pastries, :preparation_address, :string
  end
end
