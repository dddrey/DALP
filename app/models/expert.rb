class Expert < ApplicationRecord
  devise :database_authenticatable, :validatable, :rememberable, remember_for: 6.months

  has_many :interviews

  def get_name
    email.split('@')[0].capitalize
  end
end
