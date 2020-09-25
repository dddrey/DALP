class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :order
      t.integer :question_id
      t.boolean :right, default: false

      t.timestamps
    end
  end
end
