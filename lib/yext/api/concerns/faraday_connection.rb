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

        def self.faraday_connection(url)
          Faraday.new(url: url) do |c|
            c.request :json

            c.use Yext::Api::Utils::ResponseParser
            c.use Yext::Api::Utils::DefaultParameters
            c.use Yext::Api::Utils::ApiRateLimits

            c.adapter Faraday.default_adapter
          end
        end
      end
    end
  end
end
