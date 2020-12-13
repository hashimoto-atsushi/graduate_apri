class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.integer :customer_number, null: false, limit: 4
      t.string :name, null: false, limit: 32
      t.string :phone_number, limit: 16
      t.string :profession, null: false, limit: 16
      t.string :customer_in_charge, null: false, limit: 16
      t.string :department, null: false, limit: 16
      t.string :position, limit: 16

      t.timestamps
    end
    add_index :customers, :customer_number, unique: true
  end
end
