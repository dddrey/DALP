class Answer < ApplicationRecord
  belongs_to :question

  validates_presence_of :text, :question_id
end
