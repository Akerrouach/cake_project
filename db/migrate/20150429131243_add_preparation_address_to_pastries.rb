class AddPreparationAddressToPastries < ActiveRecord::Migration
  def change
    add_column :pastries, :preparation_address, :string
  end
end
