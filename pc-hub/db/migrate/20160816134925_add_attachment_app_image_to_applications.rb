class AddAttachmentAppImageToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :app_image
    end
  end

  def self.down
    remove_attachment :applications, :app_image
  end
end
