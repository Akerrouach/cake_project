class AddCreatedAtToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :created_at, :datetime
  end
end
