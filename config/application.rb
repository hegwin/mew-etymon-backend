require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MewEtymonBackend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #
    config.generators do |g|
      g.test_framework \
        :rspec,
        fixture: true,
        view_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'

      g.template_engine :slim

      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.assets          false
    end
  end
end
