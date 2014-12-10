class RenameDateColToMeetsat < ActiveRecord::Migration
  def change
    rename_column :meetups, :date, :meets_at
  end
end
