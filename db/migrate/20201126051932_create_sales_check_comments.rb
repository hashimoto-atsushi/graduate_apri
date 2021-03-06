class CreateSalesCheckComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_check_comments do |t|
      t.references :boss_check_comment, foreign_key: true
      t.boolean :confirmation
      t.date :confirmation_date, null: false
      t.text :comments, null: false, limit: 6400
      t.boolean :discussion_possibility
      t.boolean :matter_closed

      t.timestamps
    end
  end
end
