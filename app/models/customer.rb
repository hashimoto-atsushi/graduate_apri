class Customer < ApplicationRecord
  belongs_to :user_id
  validates :customer_number, null: false, limit: 4
  validates :name, null: false, limit: 32
  validates :phone_number, null: false, limit: 16
  validates :profession, null: false, limit: 16
  validates :customer_in_charge, null: false, limit: 16
  validates :department, null: false, limit: 16
  validates :position, limit: 16
end
