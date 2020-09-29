class UserTest < ApplicationRecord
  belongs_to :user

  has_many :questions, foreign_key: 'user_test_id', class_name: 'UserQuestion', dependent: :destroy

  def finished?
    self.end_at < Time.now
  end

  def generate
    1.upto(100) do |num|
      question = Question.where(order: num).shuffle[rand(0..10)]
      question_answers = question.answers

      user_question = UserQuestion.create(
        text: question.text,
        order: question.order,
        user_test_id: self.id,
        question_id: question.id,
      )

      question_answers.each do |qa|
        user_answer = UserAnswer.create(
          text: qa.text,
          order: qa.order,
          user_question_id: user_question.id,
          right: qa.right,
          answer_id: qa.id
        )
      end
    end
  end
end
