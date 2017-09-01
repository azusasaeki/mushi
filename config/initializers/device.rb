Devise.setup do |config|
  OAUTH_CONFIG = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env].symbolize_keys!
  config.omniauth :line, OAUTH_CONFIG[:line]['key'], OAUTH_CONFIG[:line]['secret']
end

class Device
end
