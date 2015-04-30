class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.float :total_price
      t.boolean :status
      t.date :delivery_date
      t.references :user, index: true
    end
    add_foreign_key :shopping_carts, :users
  end
end
