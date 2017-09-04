Rails.application.config.middleware.use OmniAuth::Builder do

  # provider :line, ENV['LINE_CHANNEL_ID'], ENV['LINE_CHANNEL_SECRET']
  # provider_ignores_state: true
end
