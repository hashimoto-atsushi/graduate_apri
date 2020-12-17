class SalesCheckComment < ApplicationRecord
  belongs_to :boss_check_comment
  validates :confirmation_date, presence: true
  validates :comments, presence: true,
                         length: { maximum: 6400 }

  validate :confirmation_date_not_before_today
  def confirmation_date_not_before_today
    errors.add(:confirmation_date, :aftertomorrow) if confirmation_date.nil? || confirmation_date < Date.today
  end

end
