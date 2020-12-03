class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid, default: "uuid_generate_v4()" do |t|
      enable_extension 'uuid-ossp'
      t.integer :room_no,       :nil => false
      t.integer :room_type_id,  :nil => false
      t.decimal :rent,          :nil => false, :default => 0.00, :precision => 10, :scale => 2
      t.boolean :is_available,  :nil => false, :default => false
      t.boolean :is_deleted,    :nil => false, :default => false

      t.timestamps
    end

    add_index :rooms, [:is_available]
  end

  def down
    drop_table :rooms
  end
end
