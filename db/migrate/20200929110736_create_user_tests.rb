class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :user_id

      t.timestamps
    end
  end
end
