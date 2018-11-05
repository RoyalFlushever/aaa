class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :home_type, default: 0
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.decimal :price, null: false
      t.text :summary
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
