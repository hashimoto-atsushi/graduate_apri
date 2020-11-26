class SalesCheckComment < ApplicationRecord
  belongs_to :boss_check_comment
  validates :confirmation, presence: true
  validates :confirmation_date, presence: true
  validates :comments, presence: true,
                         length: { maximum: 6400 }
  validates :discussion_possibility, presence: true
  validates :matter_closed, presence: true
end
