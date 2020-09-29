class UserQuestion < ApplicationRecord
  belongs_to :user_test

  has_many :answers, foreign_key: 'user_question_id', class_name: 'UserAnswer', dependent: :destroy

  # validates_presence_of :text, :user_test_id
end
