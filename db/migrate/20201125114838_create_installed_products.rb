class CreateInstalledProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :installed_products do |t|
      t.references :product, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :serial_number, null: false, limit: 8
      t.date :installed_date, null: false
      t.integer :discount_price, null: false, limit: 8

      t.timestamps
    end
  end
end
