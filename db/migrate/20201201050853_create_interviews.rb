class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.datetime :datetime_stamp
      t.string :date_string
      t.string :time_string

      t.string :zoom_room_url

      t.integer :expert_id
      t.integer :user_id

      t.timestamps
    end
  end
end
