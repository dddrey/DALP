class Interview < ApplicationRecord
  belongs_to :expert, optional: true
  belongs_to :user, optional: true

  # before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? && !zoom_room_id.present? }
  before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? }

  # BEFORE user id remove CLEAR zoom_room_id zoom_start_url zoom_join_url room_password

  def generate_zoom_room
    ZoomService.new(expert_id, user_id, id).call
  end
end
