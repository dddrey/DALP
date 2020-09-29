class User < ApplicationRecord
  PHONE_NUMBER_REGEXP = /\A7[\d]{10}\z/

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # devise :registerable, :rememberable, :validatable
  devise :registerable, :rememberable, remember_for: 6.months

  validates_presence_of :last_name, :first_name, :birth_date, :city, :education

  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  # validates :phone, presence: true, uniqueness: true, format: { with: PHONE_NUMBER_REGEXP }

  validate :full_name_uniqueness, if: proc { |user| user.middle_name.present? }

  before_save :set_movement_help, if: proc { |user| user.movement_help == nil }

  private

  def full_name_uniqueness
    errors.add(:middle_name, 'ФИО уже зарегистрирован в системе') if User.where('last_name ILIKE ? AND first_name ILIKE ? AND middle_name ILIKE ?', last_name, first_name, middle_name).any?
  end

  def set_movement_help
    self.movement_help = false
  end
end
