class Customer < ApplicationRecord
  belongs_to :user_id
  validates :customer_number, presence: true
  validates :name, presence: true,
                     length: { maximum: 32 }
  validates :phone_number, presence: true,
                             length: { maximum: 16 }
  validates :profession, presence: true,
                           length: {maximum: 16}
  validates :customer_in_charge, presence: true,
                           length: { maximum: 16 }
  validates :department, presence: true,
                            length: { maximum: 16}
  validates :position, length: { maximum: 16 }
end
