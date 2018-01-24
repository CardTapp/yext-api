# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # The default response parser for Faraday to get the results from Yext into the structure
      # that is needed by Spyke.
      class ResponseParser < Faraday::Response::Middleware
        include Yext::Api::Concerns::ApiFinder

        def call(env)
          @parse_env = env

          @app.call(env).on_complete do |environment|
            on_complete(environment)
          end
        end

        def parse(body)
          # Yext Response:
          #   http://developer.yext.com/docs/api-reference/#section/Policies-and-Conventions
          #
          #   Example response format:
          #   {
          #       "meta":     {
          #           "uuid":   "bb0c7e19-4dc3-4891-bfa5-8593b1f124ad",
          #           "errors": [
          #                         {
          #                             "code": ...error code...,
          #                             "type": ...error, fatal error, non fatal error, or warning...,
          #                             "message": ...explanation of the issue...
          #                         }
          #                     ]
          #       },
          #       "response": {
          #           ...results...
          #       }
          #   }
          #
          # Spyke Expected Response Format:
          #   https://github.com/balvig/spyke#configuration
          #
          #   { data: { id: 1, name: 'Bob' }, metadata: {}, errors: {} }
          #
          #   Errors:
          #   https://github.com/balvig/spyke#api-side-validations
          #
          #   { title: [{ error: 'blank'}, { error: 'too_short', count: 10 }]}

          # yext_response_json = MultiJson.load(body, symbolize_keys: true)
          return {} if body.starts_with?("<html")
          return { data: [{ response_string: body }], metadata: {}, errors: {} } unless body.starts_with?("{")

          yext_response_json = JSON.parse(body, symbolize_names: true)

          data = extract_data_value(yext_response_json)

          save_meta_data(find_api(parse_env[:url], parse_env[:method].to_s), yext_response_json[:meta])

          { data:     data,
            metadata: yext_response_json[:meta],
            errors:   {} }
        end

        private

        def extract_data_value(yext_response_json)
          data = yext_response_json[:response]
          data = data[(data.keys - [:count]).first] if data.is_a?(Hash) && (data.key?(:count) || data.length <= 2)

          data
        end

        attr_reader :parse_env

        def save_meta_data(api_module, metadata)
          return if api_module.blank?

          api_module.last_meta = metadata
        end
      end
    end
  end
end
