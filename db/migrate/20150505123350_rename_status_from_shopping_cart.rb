class RenameStatusFromShoppingCart < ActiveRecord::Migration
  def change
    rename_column :shopping_carts, :status, :sent
  end
end
