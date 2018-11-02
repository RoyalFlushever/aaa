class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :home_type
      t.integer :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.decimal10 :price
      t.decimal2 :price
      t.text :summary
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :active

      t.timestamps
    end
  end
end
