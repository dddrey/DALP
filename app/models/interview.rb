class Interview < ApplicationRecord
  has_one :expert
  has_one :user

  # before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? && !zoom_room_id.present? }
  before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? }

  # BEFORE user id remove CLEAR zoom_room_id zoom_start_url zoom_join_url room_password

  def generate_zoom_room
    p 'WE GONNA GENERATE ZOOM ROOM HERE'
    ZoomService.new(user_id, expert_id, id).call
  end
end
