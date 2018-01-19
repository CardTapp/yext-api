# frozen_string_literal: true

module Yext
  module Api
    module LiveApi
      # :live_api:
      #   :objects:
      #     :location:
      #       :has_many: language_profile
      #       :has_many: location_schema
      #       :actions:
      #         - :action: :index
      #           :method: :get
      #           :endpoint: https://liveapi.yext.com/v2/accounts/{accountId}/locations
      #           :path_regex: https://liveapi.yext.com/v2/accounts/[^/]+?/locations
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/live-api/#operation/locationsList
      #           :comment: >
      #             Get multiple Locations (primary profile only). Filters are evaluated against all language
      #             profiles as well as the primary profile.
      #           :sandbox_only: false
      #         - :action: :show
      #           :method: :get
      #           :endpoint: https://liveapi.yext.com/v2/accounts/{accountId}/locations/{locationId}
      #           :path_regex: https://liveapi.yext.com/v2/accounts/[^/]+?/locations/[^/]+??
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/live-api/#operation/getLocation
      #           :comment: Gets the primary profile for a single Location.
      #           :sandbox_only: false
      class Location < Yext::Api::Utils::ApiBase
        include Yext::Api::Concerns::Account

        live_api
      end
    end
  end
end
