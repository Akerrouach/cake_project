class RenameReviewFromShoppingCart < ActiveRecord::Migration
  def change
    rename_column :shopping_carts, :review, :review_status
  end
end
