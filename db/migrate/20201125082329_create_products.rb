class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type_name
      t.string :category
      t.integer :list_price
      t.date :release_date
      t.date :end_of_production
      t.date :end_of_service

      t.timestamps
    end
  end
end
