class BossCheckComment < ApplicationRecord
  belongs_to :detail_report
  has_many :sales_check_comments, dependent: :destroy
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
  validate :confirmation_date_not_before_today


  def confirmation_date_not_before_today
    errors.add(:confirmation_date, :aftertomorrow) if confirmation_date.nil? || confirmation_date < Date.today
  end
end
