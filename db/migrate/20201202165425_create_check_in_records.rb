class CreateCheckInRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :check_in_records, id: :uuid, default: "uuid_generate_v4()" do |t|
      enable_extension 'uuid-ossp'
      t.date :date,         :nil => false
      t.uuid :room_id,      :nil => false

      t.timestamps
    end

    add_index :check_in_records, [:room_id]
  end

  def down
    drop_table :check_in_records
  end
end
