class CreateBossCheckComments < ActiveRecord::Migration[5.2]
  def change
    create_table :boss_check_comments do |t|
      t.references :detail_report, foreign_key: true
      t.boolean :confirmation, null: false
      t.date :confirmation_date, null: false
      t.text :positive_comment, null: false,
                               limit: 6400
      t.text :negative_comment, null: false,
                               limit: 6400
      t.text :assistance, null: false,
                         limit: 6400
      t.text :questions, null: false,
                        limit: 6400
      t.text :report_to_sales, null: false,
                              limit: 6400

      t.timestamps
    end
  end
end
