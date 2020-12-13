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
  enum planed_or_argent: {計画:0 , 緊急:1}
  enum closed: {未完了:0 , 完了:1}

end
