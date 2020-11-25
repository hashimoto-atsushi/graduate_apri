class User < ApplicationRecord
  validates :employee_number, presence: true
  validates :name, presence: true,
                     length: { maximum: 32 }
  validates :password, presence: true,
                         length: { minimum: 6 }
  validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum department: {sales:0, tech:1, systems:2}
  enum position: {manager:0, chief:1, staff:2}
  enum stay_or_left: {stay:0 , left:1}
  has_many :customers
end
