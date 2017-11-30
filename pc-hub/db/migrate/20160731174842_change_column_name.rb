class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :applications, :operating_system, :platform
  end
end
