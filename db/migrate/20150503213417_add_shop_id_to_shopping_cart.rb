class AddShopIdToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :shop_id, :integer
  end
end
