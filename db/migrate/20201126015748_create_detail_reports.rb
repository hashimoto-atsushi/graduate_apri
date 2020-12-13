class CreateDetailReports < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_reports do |t|
      t.references :support_program, foreign_key: true
      t.date :ordered_date, null: false
      t.integer :ordered_price, null: false, limit: 6
      t.date :actual_kickoff_date, null: false
      t.date :actual_complete_date, null: false
      t.text :service_detail, null: false, limit: 6400
      t.text :photo
      t.text :results, null: false, limit:6400
      t.integer :evaluation, null: false, limit: 4
      t.text :evaluation_details, null: false, limit: 6400

      t.timestamps
    end
  end
end
