class CreateCompornents < ActiveRecord::Migration[5.2]
  def change
    create_table :compornents do |t|
      t.integer :product_id
      t.integer :part_id

      t.timestamps
    end
  end
end
