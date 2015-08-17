require 'rollbar/rails'
Rollbar.configure do |config|
  # Without configuration, Rollbar is enabled in all environments.
  # To disable in specific environments, set config.enabled=false.
  
  config.access_token = ENV['rollbar']

  # Here we'll disable in 'test':
  if Rails.env.test? || Rails.env.development? 
    config.enabled = false
  end

end