class RemoveLocationidFromMeetupsTable < ActiveRecord::Migration
  def change
    remove_column :meetups, :location_id, :integer, null: false
  end
end
