class UserQuestion < ApplicationRecord
  belongs_to :user_test

  has_many :user_answers

  # validates_presence_of :text, :user_test_id
end
