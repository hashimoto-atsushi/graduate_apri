class InstalledProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  validates :serial_number, presence: true,
                                length: { maximum: 16 }
  validates :installed_date, presence: true
  validates :discount_price, presence: true,
                               length: { maximum: 16 }

  validate :installed_date_not_after_today
  def installed_date_not_after_today
   errors.add(:installed_date, :beforetomorrow) if installed_date.nil? || installed_date > Date.today
  end
end
