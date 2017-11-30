class AddAttachmentSliderImageToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :slider_image
    end
  end

  def self.down
    remove_attachment :applications, :slider_image
  end
end
