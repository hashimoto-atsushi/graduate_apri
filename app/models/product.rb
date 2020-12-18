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

  validate :release_date_not_before_today
  validate :end_of_production_not_before_today
  validate :end_of_service_not_before_today
  def release_date_not_before_today
    errors.add(:release_date, :aftertomorrow) if release_date.nil? || release_date < Date.today
  end
  def end_of_production_not_before_today
    errors.add(:end_of_production, :aftertomorrow) if end_of_production.nil? || end_of_production < Date.today
  end
  def end_of_service_not_before_today
    errors.add(:end_of_service, :aftertomorrow) if end_of_service.nil? || end_of_service < Date.today
  end
end
