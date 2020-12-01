class AddInterviewZoomAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_column :interviews, :zoom_room_url, :zoom_room_id
    add_column :interviews, :zoom_start_url, :string
    add_column :interviews, :zoom_join_url, :string
    add_column :interviews, :room_password, :string
  end
end
