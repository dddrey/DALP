class Question < ApplicationRecord
  attr_accessor :right_answers_count

  belongs_to :test

  has_many :answers

  accepts_nested_attributes_for :answers

  validates_presence_of :text, :test_id

  validate :count_of_right_answers

  private

  def count_of_right_answers
    errors.add(:answers, "count can't be more or less then 1") if right_answers_count.present? && right_answers_count != 1
  end
end
