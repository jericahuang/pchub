class AddApplicationToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :application, index: true, foreign_key: true
  end
end
