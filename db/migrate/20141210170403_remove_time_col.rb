class RemoveTimeCol < ActiveRecord::Migration
  def change
    remove_column :meetups, :time, :datetime, null: false
  end
end
