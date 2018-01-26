# frozen_string_literal: true

module Yext
  module Api
    module Utils
      module Middleware
        # Faraday Middleware for adding Configuration default values to API calls as needed.
        #
        # Most options can be set via scopes and the soped values will be kept if they are used.
        #
        # The following configuration options are defaulted:
        #   validation_level: Added to query parameters if not already there and is not nil
        #   api_key:          Added to query parameters if not already there
        #   api_version:      Added to qeury parameters if not already there
        #   account_id:       Inserted into the path if the path includes the Account default URI and no
        #                     account_id was specified.
        class DefaultParameters < Faraday::Response::Middleware
          attr_reader :configuration

          def call(request_env)
            @configuration = Yext::Api.configuration
            url            = request_env[:url]
            params         = Rack::Utils.parse_nested_query(url.query).with_indifferent_access

            add_username_headers(request_env, configuration, params)
            add_default_query_params(configuration, params)
            save_query_params(url, params)

            @app.call(request_env)
          end

          private

          def add_default_query_params(configuration, params)
            params.reverse_merge!(api_key: configuration.api_key,
                                  v:       configuration.api_version || "20161012")

            params[:validation] ||= configuration.validation_level if configuration.validation_level.present?
          end

          def save_query_params(url, params)
            url.query = params.to_query
          end

          def add_username_headers(request_env, configuration, params)
            username = params.delete(:yext_username) || configuration.yext_username
            user_id  = params.delete(:yext_user_id) || configuration.yext_user_id

            return unless %w[put post patch delete].include?(request_env[:method].to_s)

            request_headers                  = request_env[:request_headers]
            request_headers["Yext-Username"] = username if username.present?
            request_headers["Yext-User-Id"]  = user_id if user_id.present?
          end
        end
      end
    end
  end
end
