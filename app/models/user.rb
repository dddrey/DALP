class User < ApplicationRecord
  PHONE_NUMBER_REGEXP = /\A7[\d]{10}\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :last_name, :first_name, :birth_date, :city, :education

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :phone, presence: true, uniqueness: true, format: { with: PHONE_NUMBER_REGEXP }
end
