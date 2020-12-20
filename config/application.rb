require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecipeGram
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    # Groupdate.time_zone = "Pacific Time (US & Canada)"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.to_prepare do
      Devise::SessionsController.layout "devise"
      Devise::RegistrationsController.layout "devise"
      Devise::ConfirmationsController.layout "devise"
      Devise::UnlocksController.layout "devise"
      Devise::PasswordsController.layout "devise"
      HomeController.layout "home"
      ChatsController.layout "chat"
      ContactController.layout "devise"
    end
  end
end
