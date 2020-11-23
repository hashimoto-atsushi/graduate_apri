class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum department: {sales:0, tech:1, systems:2}
  enum position: {manager:0, chief:1, staff:2}
  enum permission: {true:true , false:false}
  enum stay_or_left: {stay:0 , left:1}
end
