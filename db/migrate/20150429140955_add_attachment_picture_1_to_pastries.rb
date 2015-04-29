class AddAttachmentPicture1ToPastries < ActiveRecord::Migration
  def self.up
    change_table :pastries do |t|
      t.attachment :picture_1
    end
  end

  def self.down
    remove_attachment :pastries, :picture_1
  end
end
