class AddSecondStageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :second_stage, :boolean, default: false
  end
end
