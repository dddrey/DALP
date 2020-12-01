class Expert < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  has_many :interviews
end
