class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false

      t.timestamps
    end
  end
end
