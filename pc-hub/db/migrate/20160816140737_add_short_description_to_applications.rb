class AddShortDescriptionToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :short_description, :string
  end
end
