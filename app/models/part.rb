class Part < ApplicationRecord
  validates :name, presence: true,
                     length: { maximum: 32 }
  validates :type_name, presence: true,
                             length: { maximum: 32 }
  validates :category, presence: true,
                           length: {maximum: 32}
  validates :list_price, presence: true,
                           length: { maximum: 16 }
  validates :stock, presence: true,
                           length: { maximum: 16 }
  validates :release_date, presence: true
  validates :end_of_production, presence:true
  validates :end_of_service, presence:true
  # belongs_to :detail_report
end
