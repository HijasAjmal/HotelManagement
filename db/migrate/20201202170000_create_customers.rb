class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name,           :nil => false
      t.string :middle_name
      t.string :last_name,            :nil => false
      t.text :address,                :nil => false
      t.string :phone,                :nil => false
      t.string :email
      t.integer :gender,              :nil => false
      t.integer :age,                 :nil => false
      t.integer :status
      t.uuid :check_in_record_id,     :nil => false

      t.timestamps
    end

    add_index :customers, [:check_in_record_id]
  end

  def down
    drop_table :customers
  end
end
