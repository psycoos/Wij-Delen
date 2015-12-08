class AddAttachmentImageToShareables < ActiveRecord::Migration
  def self.up
    change_table :shareables do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :shareables, :image
  end
end
