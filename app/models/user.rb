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
  #ここから追記
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.user_welcome_mail(self).deliver
  end
  #ここまで

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum department: {営業部:0, 技術部:1, システム部:2}
  enum position: {部長:0, 課長:1, 一般:2}
  enum stay_or_left: {在籍:0 , 退職:1}
  has_many :customers
  has_many :support_programs
end
