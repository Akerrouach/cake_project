class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.attachment :picture
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :shops, :users
  end
end
