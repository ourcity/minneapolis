require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Minneapolis
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # we're in Minnesota, fools
    config.time_zone = 'America/Chicago'

    # GovDelivery Transactional Messaging Service
    config.tms_root  = ENV['TMS_ROOT']
    config.tms_token = ENV['TMS_TOKEN']

    config.twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
    config.twilio_token       = ENV['TWILIO_TOKEN']
    config.twilio_number      = ENV['TWILIO_NUMBER']

    if config.tms_token.blank?
      config.action_mailer.delivery_method = :file
    else
      config.action_mailer.delivery_method          = :govdelivery_tms
      config.action_mailer.govdelivery_tms_settings = {
        auth_token: config.tms_token,
        api_root: config.tms_root
      }
    end


  end
end
