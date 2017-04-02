class AddAttachmentPhotoToHouses < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :houses, :photo
  end
end
