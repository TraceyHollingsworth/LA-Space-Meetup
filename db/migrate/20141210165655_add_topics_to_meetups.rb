class AddTopicsToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :topic, :string, null: false
  end
end
