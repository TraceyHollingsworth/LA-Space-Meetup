class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic, null: false
      t.integer :meetup_id, null: false

      t.timestamps
    end
  end
end
