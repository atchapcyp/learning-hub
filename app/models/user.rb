class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :usercourseactions
  has_many :courses, :through => :usercourseactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NULL_ATTRS = %w( instructor_id student_id department_name )
  before_save :nil_if_blank

  protected
  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
