class AddAcceptedToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :accepted, :boolean
  end
end
