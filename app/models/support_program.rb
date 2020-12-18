class SupportProgram < ApplicationRecord
  has_many :detail_reports, dependent: :destroy
  belongs_to :customer
  belongs_to :user
  validates :title_number, presence: true,
                         uniqueness: true,
                             length: { maximum: 16 }
  validates :title, presence: true,
                      length: { maximum: 32 }
  validates :main_work, presence: true,
                          length: {maximum: 255}
  validates :planed_or_argent, presence: true
  validates :kick_off_date, presence:true
  validates :closed, presence:true
  enum planed_or_argent: {planed:0 , argent:1}
  enum closed: {not_completed:0 , completed:1}

  validate :kick_off_date_not_before_today
  def kick_off_date_not_before_today
    errors.add(:kick_off_date, :aftertomorrow) if kick_off_date.nil? || kick_off_date < Date.today
  end
end
