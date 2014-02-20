RailsAdmin.config do |config|
  config.main_app_name = ['Paris.rb', 'Admin']
  config.authenticate_with { warden.authenticate! scope: :user }
  config.current_user_method(&:current_user)
  config.default_items_per_page = 30
end
