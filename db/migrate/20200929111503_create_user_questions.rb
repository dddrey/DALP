class CreateUserQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questions do |t|
      t.string :text
      t.integer :order
      t.integer :user_test_id
      t.integer :question_id

      t.timestamps
    end
  end
end
