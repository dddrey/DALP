class Answer < ApplicationRecord
  belongs_to :question

  validates_presence_of :text, :question_id

  # validate :right_answers_count

  private

  def right_answers_count
    # p answers.where(right: true)
    # p answers.where(right: true).count
    errors.add(:answers, 'Only one right answer is allowed') unless question.answers.where(right: true).count == 1
  end
end
