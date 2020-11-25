class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      # t.references :detail_report, foreign_key: true
      t.string :name, null: false, limit: 32
      t.string :type_name, null: false, limit: 32
      t.string :category, null: false, limit: 32
      t.integer :list_price, null: false, limit: 4
      t.integer :stock, null: false, limit: 4
      t.date :release_date, null: false
      t.date :end_of_production, null: false
      t.date :end_of_service, null: false

      t.timestamps
    end
  end
end
