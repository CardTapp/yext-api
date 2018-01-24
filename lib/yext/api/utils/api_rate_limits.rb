# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # Faraday Middleware for extracting API limits from call responses.
      class ApiRateLimits < Faraday::Response::Middleware
        include Yext::Api::Concerns::ApiFinder

        def call(env)
          @app.call(env).on_complete do |environment|
            save_rates(environment, find_api(env[:url], env[:method].to_s))

            env.response
          end
        end

        private

        def save_rates(environment, api_module)
          return if api_module.blank?

          api_module.last_status = environment[:status]

          response_headers = environment[:response_headers]

          return unless response_headers.key?("rate-limit-remaining")

          api_module.update_rates(remaining: response_headers["rate-limit-remaining"].to_i,
                                  limit:     response_headers["rate-limit-limit"].to_i,
                                  reset_at:  Time.at(response_headers["rate-limit-reset"].to_i))
        end
      end
    end
  end
end
