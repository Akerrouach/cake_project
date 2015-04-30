class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.date :delivery_date
      t.boolean :status
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
