class AddInterviewTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :interview_token, :string
  end
end
