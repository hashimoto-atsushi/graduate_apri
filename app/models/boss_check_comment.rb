class BossCheckComment < ApplicationRecord
  belongs_to :detail_report
  has_one :sales_check_comment
  validates :confirmation_date, presence: true
  validates :positive_comment, presence: true,
                             length: { maximum: 6400 }
  validates :negative_comment, presence: true,
                           length: {maximum: 6400 }
  validates :assistance, presence: true,
                           length: { maximum: 6400 }
  validates :questions, presence: true,
                            length: { maximum: 6400}
  validates :report_to_sales, presence: true,
                     length: { maximum: 6400 }
end
