# frozen_string_literal: true

require "yext/api/engine"

module Yext
  # API interface for Yext
  module Api
    # Allows you to configure global settings for the Yext::Api.
    #
    # See Yext::Api::Utils::Configuration for details on the configuration options.
    #
    # Usage:
    #
    # Yext::Api.configure do |config|
    #   config.account_id = "my account_id"
    #   config.api_key    = "my api key"
    # end
    def self.configure
      yield configuration if block_given?
    end

    # Gets the configuration object for configuring a single item.
    #
    # See Yext::Api::Utils::Configuration for details on the configuration options.
    #
    # Usage:
    #
    # Yext::Api.configuration.api_key = "my api key"
    def self.configuration
      Yext::Api::Utils::Configuration.instance
    end
  end
end
