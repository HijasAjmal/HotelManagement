class CreateCheckOutRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :check_out_records do |t|
      t.date :date,               :nil => false
      t.uuid :room_id,            :nil => false
      t.integer :customer_id,     :nil => false
      t.decimal :total_amount,    :nil => false
      t.integer :total_days,      :nil => false
      t.string :reason,           :nil => false

      t.timestamps
    end

    add_index :check_out_records, [:room_id, :customer_id]
  end

  def down
    drop_table :check_out_records
  end
end
