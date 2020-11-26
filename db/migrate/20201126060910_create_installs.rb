class CreateInstalls < ActiveRecord::Migration[5.2]
  def change
    create_table :installs do |t|
      t.integer :customer_id
      t.integer :installed_product_id

      t.timestamps
    end
  end
end
