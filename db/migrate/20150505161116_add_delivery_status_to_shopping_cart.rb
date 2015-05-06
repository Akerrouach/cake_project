class AddDeliveryStatusToShoppingCart < ActiveRecord::Migration
  def change
     add_column :shopping_carts, :delivery_status, :boolean
  end
end
