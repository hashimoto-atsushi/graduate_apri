class DetailReport < ApplicationRecord
  belongs_to :support_program
  has_many :boss_check_comments, dependent: :destroy
  validates :ordered_date, presence: true
  validates :ordered_price, presence: true,
                              length: { maximum: 16 }
  validates :actual_kickoff_date, presence: true
  validates :actual_complete_date, presence: true
  validates :service_detail, presence: true,
                               length: { maximum: 6400 }
  validates :results, presence: true,
                        length: { maximum: 6400 }
  validates :evaluation, presence:true,
                           length: { maximum: 16 }
  validates :evaluation_details, presence:true,
                                   length: { maximum: 6400 }
  enum evaluation: { 高評価:0 , 低評価:1}

  validate :ordered_date_not_after_today
  validate :actual_kickoff_date_not_after_today
  validate :actual_complete_date_not_after_today
  def ordered_date_not_after_today
    errors.add(:ordered_date, :beforetomorrow) if ordered_date.nil? || ordered_date > Date.today
  end
  def actual_kickoff_date_not_after_today
    errors.add(:actual_kickoff_date, :beforetomorrow) if actual_kickoff_date.nil? || actual_kickoff_date > Date.today
  end
  def actual_complete_date_not_after_today
    errors.add(:actual_complete_date, :beforetomorrow) if actual_complete_date.nil? || actual_complete_date > Date.today
  end

end
