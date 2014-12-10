class DropTopicsTable < ActiveRecord::Migration
  def change
    drop_table :topics do |t|
      t.string :topic, null: false
      t.integer :meetup_id, null: false

      t.timestamps
    end
  end
end
