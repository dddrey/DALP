class ZoomService
  attr_reader :expert_id, :user_id, :interview_id

  def initialize(expert_id, user_id, interview_id)
    @expert = Expert.find(expert_id)
    @user = User.find(user_id)
    @interview = Interview.find(interview_id)
  end

  def call
    zoom_ids = [
      { epxert_id: 1, zoom_id: 'ltPbCutDRWm50OeUk9EXlQ', name: 'tair' },
      { epxert_id: 2, zoom_id: 'i4CQzOXpRrCSrw-EpRkQIQ', name: 'rami' },
      { epxert_id: 3, zoom_id: 'mtJciYQjQxGtzpv3eZmxMg', name: 'wafaa' }
    ]

    # wafaa_zoom_id = 'mtJciYQjQxGtzpv3eZmxMg'
    # rami_zoom_id = 'i4CQzOXpRrCSrw-EpRkQIQ'
    # tair_zoom_id = 'ltPbCutDRWm50OeUk9EXlQ'
    # doha_zoom_id = 'f3jQSM1bRlayqEix4pv0Rg'

    zoom_client = Zoom.new
    zoom_params = {
      topic: "Интервью #{@expert.get_name} с #{@user.full_name}",
      type: 2,
      start_time: @interview.datetime_stamp.utc.strftime('%Y-%m-%dT%H:%M:%S'),
      duration: 45,
      timezone: 'Europe/Moscow',
      user_id: zoom_ids.filter{|item| item[:epxert_id] == @expert.id}[0][:zoom_id]
    }
    # schedule_for: 'dalp@qatarrussia.ru',

    meeting_response = zoom_client.meeting_create(zoom_params)
    @interview.update(
      zoom_room_id: meeting_response['id'],
      zoom_start_url: meeting_response['start_url'],
      zoom_join_url: meeting_response['join_url'],
      room_password: meeting_response['password']
    )
    p zoom_params
    p '_'
    p meeting_response

  end
end
