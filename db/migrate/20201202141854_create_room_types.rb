class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :room_types
  end
end
