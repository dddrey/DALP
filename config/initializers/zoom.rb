Zoom.configure do |c|
  c.api_key = Rails.application.credentials.dig(:zoom_api_key)
  c.api_secret = Rails.application.credentials.dig(:zoom_api_secret)
end
