# frozen_string_literal: true

module Yext
  module Api
    module Utils
      module Middleware
        # The default response parser for Faraday to get the results from Yext into the structure
        # that is needed by Spyke.
        class ResponseParser < Faraday::Response::Middleware
          def call(env)
            @parse_env = env

            @app.call(env).on_complete do |environment|
              @response_env = environment
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

            if body.starts_with?("<html")
              save_meta_data(parse_env, {}, response_env[:status], body: body)

              return {}
            end

            @yext_response_json = {}

            data      = data_value(body)
            meta_data = meta_data_value

            save_meta_data(parse_env, meta_data, response_env[:status], data)

            { data: data, metadata: meta_data, errors: {} }
          end

          private

          def data_value(body)
            return [{ response_string: body }] unless body.starts_with?("{")

            @yext_response_json = JSON.parse(body, symbolize_names: true)

            extract_data_value
          end

          def meta_data_value
            yext_response_json[:meta]
          end

          def extract_data_value
            data = yext_response_json[:response]

            if data.is_a?(Hash) && (data.key?(:count) || data.length <= 2)
              array_data = data[(data.keys - [:count]).first]
              if array_data.is_a?(Array)
                data = array_data
              elsif data.blank?
                data = nil
              end
            end

            data
          end

          attr_reader :parse_env,
                      :yext_response_json,
                      :response_env

          def save_meta_data(environment, metadata, status, data)
            api_module = Yext::Api::Utils::ApiFinder.new(environment[:url], environment[:method]).find_api
            return if api_module.blank?

            api_module.send(:last_data=, data)
            api_module.send(:last_status=, status)
            api_module.send(:last_meta=, metadata)
          end
        end
      end
    end
  end
end
