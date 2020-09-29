class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.string :text
      t.integer :order
      t.integer :user_question_id
      t.boolean :right, default: false
      t.integer :answer_id

      t.timestamps
    end
  end
end
