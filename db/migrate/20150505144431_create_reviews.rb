class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :shop, index: true
      t.references :shopping_cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :shops
    add_foreign_key :reviews, :shopping_carts
  end
end
