class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :usercourseactions
  has_many :courses, :through => :usercourseactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 10..128
  validates :email, presence: true,
            length: {minimum: 6}
  validates :citizen_id, presence: true,length: {minimum: 10},format: {with:/\A^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$\z/,message: "must be numeric only"}

  NULL_ATTRS = %w( instructor_id student_id department_name )
  before_save :nil_if_blank

  protected
  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
