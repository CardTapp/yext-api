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
      #           :sandbox_only: false
      #         - :action: :show
      #           :method: :get
      #           :endpoint: https://liveapi.yext.com/v2/accounts/{accountId}/locations/{locationId}
      #           :path_regex: https://liveapi.yext.com/v2/accounts/[^/]+?/locations/[^/]+??
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/live-api/#operation/getLocation
      #           :sandbox_only: false
      class Location < Yext::Api::Utils::ApiBase
        include Yext::Api::Concerns::AccountChild

        live_api
      end
    end
  end
end
