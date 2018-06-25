class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :github, :string
    add_column :users, :gitAvatar, :string
  end
end
