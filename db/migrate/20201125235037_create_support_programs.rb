class CreateSupportPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :support_programs do |t|
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :title_number, null: false, limit: 4
      t.string :title, null: false, limit: 32
      t.text :main_work, null: false, limit: 255
      t.integer :planed_or_argent, null: false
      t.boolean :order_status, null: false, default: false
      t.date :kick_off_date, null: false
      t.integer :closed, null: false

      t.timestamps
    end
  end
end
