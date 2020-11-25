class InstalledProduct < ApplicationRecord
  belongs_to :product
  validates :serial_number, presence: true,
                                length: { maximum: 16 }
  validates :installed_date, presence: true
  validates :discount_price, presence: true,
                               length: { maximum: 16 }
end
