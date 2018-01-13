# frozen_string_literal: true

require_relative "boot"

# use "yext/include_rails" instead of "rails/all" so that tests don't accidentally mask a
# piece of Rails that we're using in the engine.  If we need something for tests but not the engine,
# we can add it here, but we should avoid that if possible.
# require "rails/all"
require "yext/include_rails"

Bundler.require(*Rails.groups)
require "yext/api"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
