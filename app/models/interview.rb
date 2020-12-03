class Interview < ApplicationRecord
  belongs_to :expert, optional: true
  belongs_to :user, optional: true

  # before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? && !zoom_room_id.present? }
  before_save :generate_zoom_room, if: -> { user_id_was.nil? && user_id.present? }

  def generate_zoom_room
    ZoomService.new(expert_id, user_id, id).call
  end

  def reset
    zoom_client = Zoom.new
    zoom_client.meeting_delete(meeting_id: self.zoom_room_id)

    self.update(
      user_id: nil,
      zoom_room_id: '',
      zoom_start_url: '',
      zoom_join_url: '',
      room_password: ''
    )
  end
end
