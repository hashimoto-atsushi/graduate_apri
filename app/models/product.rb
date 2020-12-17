class Product < ApplicationRecord
  has_many :installed_products
  validates :name, presence: true,
                     length: { maximum: 32 }
  validates :type_name, presence: true,
                             length: { maximum: 32 }
  validates :category, presence: true,
                           length: {maximum: 32}
  validates :list_price, presence: true,
                           length: { maximum: 16 }
  validates :release_date, presence: true
  validates :end_of_production, presence:true
  validates :end_of_service, presence:true
  validate :date_not_before_today

  def date_not_before_today
    errors.add(:end_of_production, "は今日以降のものを選択してください") if end_of_production.nil? || end_of_production < Date.today
  end
end
