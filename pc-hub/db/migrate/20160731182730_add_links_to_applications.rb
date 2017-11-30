class AddLinksToApplications < ActiveRecord::Migration
  def change
  	add_column :applications, :app_link, :string
  	add_column :applications, :repository_link, :string
  end
end
