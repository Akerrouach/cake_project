class AddDeliveryChoiceToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :delivery_choice, :boolean
  end
end
