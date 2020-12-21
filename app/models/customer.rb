class Customer < ApplicationRecord
  belongs_to :user
  has_many :installed_products, dependent: :destroy
  has_many :support_programs, dependent: :destroy
  validates :customer_number, presence: true,
                            uniqueness: true,
                                length: { maximum: 16 },
                          numericality: {only_integer: true, greater_than_or_equal_to: 0}                        
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
