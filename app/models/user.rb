class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :course_users
  has_many :courses, :through => :course_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
