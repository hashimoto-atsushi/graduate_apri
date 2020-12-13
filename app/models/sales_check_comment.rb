class SalesCheckComment < ApplicationRecord
  belongs_to :boss_check_comment
  validates :confirmation_date, presence: true
  validates :comments, presence: true,
                         length: { maximum: 6400 }
end
