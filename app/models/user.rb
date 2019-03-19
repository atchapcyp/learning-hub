class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :usercourseactions
  has_many :courses, :through => :usercourseactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
