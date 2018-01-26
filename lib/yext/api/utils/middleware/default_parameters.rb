# frozen_string_literal: true

module Yext
  module Api
    module Utils
      module Middleware
        # Faraday Middleware for adding Configuration default values to API calls as needed.
        #
        # Most options can be set via scopes and the soped values will be kept if they are used.
        # i.e. the existing query string values will be kept if they exist.
        #
        # Because Spyke puts `where` options into the body OR the query depending on the type of
        # request being made, we have to move the Yext query options out of the body into the query
        # if there is a body.
        #
        # The following configuration options are defaulted:
        #   validation_level: Added to query parameters if not already there and is not nil
        #   api_key:          Added to query parameters if not already there
        #   api_version:      Added to qeury parameters if not already there
        #   account_id:       Inserted into the path if the path includes the Account default URI and no
        #                     account_id was specified.
        #
        # The following values will be moved out of the body into the query string if they are found:
        #   account_id      * Not used if in body.  If set it will already be in the path.
        #   v
        #   api_key
        #   validation
        #   yext_username
        #   yext_user_id
        class DefaultParameters < Faraday::Response::Middleware
          extend Memoist

          attr_reader :configuration,
                      :url,
                      :params,
                      :body_json,
                      :request_env

          def call(call_env)
            get_attribute_values(call_env)

            body_json.delete(:account_id)
            add_username_headers
            add_default_query_params
            save_query_params
            save_body

            @app.call(request_env)
          end

          private

          def get_attribute_values(call_env)
            @request_env   = call_env
            @configuration = Yext::Api.configuration
            @url           = request_env[:url]
            @params        = Rack::Utils.parse_nested_query(url.query).with_indifferent_access
            @body_json     = parse_body
          end

          def parse_body
            if request_env.body.present?
              JSON.parse(request_env.body, symbolize_names: true)
            else
              {}
            end
          end

          def add_default_query_params
            params.reverse_merge!(api_key: api_key, v: version)

            params[:validation] ||= validation if validation.present?
          end

          def validation
            return body_json.delete(:validation) if body_json.key?(:validation)

            configuration.validation_level if configuration.validation_level.present?
          end

          def version
            body_json.delete(:v) || configuration.api_version || "20161012"
          end

          def api_key
            body_json.delete(:api_key) || configuration.api_key
          end

          def save_query_params
            url.query = params.to_query
          end

          def save_body
            extract_rooted_body

            return if request_env.body.blank?

            body_json[:id] = body_json.delete(:create_id) if body_json.key?(:create_id)

            request_env.body = body_json.to_json
          end

          def extract_rooted_body
            return unless body_json.keys.length == 1

            sub_json   = body_json[body_json.keys.first]
            @body_json = sub_json if sub_json.is_a?(Hash)
          end

          def add_username_headers
            user_id, username = extract_header_values

            return unless %w[put post patch delete].include?(request_env[:method].to_s)

            request_headers                  = request_env[:request_headers]
            request_headers["Yext-Username"] = username if username.present?
            request_headers["Yext-User-Id"]  = user_id if user_id.present?
          end

          def extract_header_values
            username = extract_defaulted_value(:yext_username, configuration.yext_username)
            user_id  = extract_defaulted_value(:yext_user_id, configuration.yext_user_id)

            [user_id, username]
          end

          def extract_defaulted_value(param_name, default_value)
            params.delete(param_name) || body_json.delete(param_name) || default_value
          end

          memoize :validation,
                  :version,
                  :api_key
        end
      end
    end
  end
end
