class CreateLocationsColumnsInMeetupsTable < ActiveRecord::Migration
  def change
    add_column :meetups, :location, :string, null: false
    add_column :meetups, :address, :string, null: false
    add_column :meetups, :city, :string, null: false
    add_column :meetups, :state, :string, null: false
    add_column :meetups, :zipcode, :string, null: false
  end
end
