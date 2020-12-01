class Interview < ApplicationRecord
  has_one :expert, optional: true
  has_one :user, optional: true

end
