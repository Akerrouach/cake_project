class AddTimestampsShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :created_at, :datetime
    add_column :shopping_carts, :updated_at, :datetime
  end
end
