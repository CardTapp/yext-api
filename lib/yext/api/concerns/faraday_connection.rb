# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This module defines methods that set the connection for a Spyke class.
      #
      # The default connection is to the sandbox or the API based on the value of the configuration
      # sandbox setting.
      #
      # A class function live_api is provided to allow LiveApi module classes to use the live endpoint.
      module FaradayConnection
        extend ActiveSupport::Concern

        included do
          url = if Yext::Api.configuration.sandbox
                  "https://sandbox.yext.com/v2"
                else
                  "https://api.yext.com/v2"
                end

          self.connection = Yext::Api::Concerns::FaradayConnection.faraday_connection(url)
        end

        class_methods do
          def live_api
            self.connection = Yext::Api::Concerns::FaradayConnection.faraday_connection("https://live.yext.com/v2")
          end
        end

        class << self
          def faraday_connection(url)
            Faraday.new(url: url) do |c|
              c.request :json
              c.request :retry,
                        max:                 2,
                        interval:            0.05,
                        interval_randomness: 0.5,
                        backoff_factor:      2

              add_middleware(c)

              c.adapter Faraday.default_adapter
            end
          end

          private

          def add_middleware(c)
            c.use Yext::Api::Utils::Middleware::ResponseParser
            c.use Yext::Api::Utils::Middleware::DefaultParameters
            c.use Yext::Api::Utils::Middleware::ApiRateLimits
            c.use Yext::Api::Utils::Middleware::UriCleanup
          end
        end
      end
    end
  end
end
