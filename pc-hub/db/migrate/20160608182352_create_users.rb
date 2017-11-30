class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :country
      t.string :state_or_province
      t.string :city
      t.string :profile_link
      t.text :additional_information

      t.timestamps null: false
    end
  end
end
