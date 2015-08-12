ActiveAdmin.setup do |config|

  config.site_title = "360Me"

  config.authentication_method = :authenticate_administrator!
  config.current_user_method   = :current_administrator
  config.logout_link_path = :destroy_administrator_session_path

  # == Batch Actions
  #
  # Enable and disable Batch Actions
  #
  config.batch_actions = true

end
