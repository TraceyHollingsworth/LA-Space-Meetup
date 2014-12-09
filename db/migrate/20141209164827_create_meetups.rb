class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :location_id, null: false
      t.datetime :date, null: false
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
