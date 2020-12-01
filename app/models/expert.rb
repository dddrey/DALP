class Expert < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  has_many :interviews

  def get_name
    email.split('@')[0].capitalize
  end
end
