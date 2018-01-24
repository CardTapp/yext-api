# frozen_string_literal: true

# TODO: Complete and test.  Untested initial framework class.
module Yext
  module Api
    module KnowledgeApi
      module KnowledgeManager
        # :knowledge_api:
        #   :knowledge_manager:
        #     :Location:
        #       - :action: :index
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations
        #         :path_regex: v2/accounts/[^/]+?/locations
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/getLocations
        #         :comment: Get multiple Locations (primary profiles only).
        #         :sandbox_only: false
        #       - :action: :create
        #         :method: :post
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations
        #         :path_regex: v2/accounts/[^/]+?/locations
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/createLocation
        #         :comment: Create a new Location.
        #         :sandbox_only: false
        #       - :action: :search
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locationsearch
        #         :path_regex: v2/accounts/[^/]+?/locationsearch
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/searchLocations
        #         :comment: Get multiple Locations (primary profiles only) that match provided filters.
        #         :sandbox_only: false
        #       - :action: :show
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations/{locationId}
        #         :path_regex: v2/accounts/[^/]+?/locations/[^/]+??
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/getLocation
        #         :comment: Gets the primary profile for a single Location.
        #         :sandbox_only: false
        #       - :action: :update
        #         :method: :put
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations/{locationId}
        #         :path_regex: v2/accounts/[^/]+?/locations/[^/]+??
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/updateLocation
        #         :comment: Updates the primary profile for a Location.
        #         :sandbox_only: false
        class Location < Yext::Api::Utils::ApiBase
          include Yext::Api::Concerns::AccountChild

          # TODO: Custom endpoints
        end
      end
    end
  end
end
