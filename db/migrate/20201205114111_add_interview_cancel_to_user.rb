class AddInterviewCancelToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :interview_cancel, :string
  end
end
