class AddMiddleScoreToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :middle_score, :string
  end
end
