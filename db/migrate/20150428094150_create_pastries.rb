class CreatePastries < ActiveRecord::Migration
  def change
    create_table :pastries do |t|
      t.string :title
      t.text :description
      t.decimal :price_per_unit
      t.datetime :confirmed_at
      t.string :state
      t.string :unit_volume
      t.string :preparation_address
      t.decimal :longitude
      t.decimal :latitude
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :pastries, :shops
  end
end
