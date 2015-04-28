class CreatePastryPictures < ActiveRecord::Migration
  def change
    create_table :pastry_pictures do |t|
      t.attachment :picture
      t.references :pastry, index: true

      t.timestamps null: false
    end
    add_foreign_key :pastry_pictures, :pastries
  end
end
