class AddAnsweredAndAnsweredRightAndUserAnswerTextAndUserAnsweredIdToUserQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :user_questions, :answered, :boolean, default: false
    add_column :user_questions, :answered_right, :boolean, default: false
    add_column :user_questions, :user_answer_text, :string
    add_column :user_questions, :user_answered_id, :integer
  end
end
