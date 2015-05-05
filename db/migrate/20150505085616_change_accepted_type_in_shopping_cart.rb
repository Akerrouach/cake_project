class ChangeAcceptedTypeInShoppingCart < ActiveRecord::Migration
  def change
    change_column :shopping_carts, :accepted, :string
  end
end
