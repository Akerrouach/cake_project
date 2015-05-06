class AddColumnsToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :review, :boolean, default: false
  end
end
