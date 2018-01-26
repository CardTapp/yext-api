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
        #         :sandbox_only: false
        #       - :action: :create
        #         :method: :post
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations
        #         :path_regex: v2/accounts/[^/]+?/locations
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/createLocation
        #         :sandbox_only: false
        #       - :action: :search
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locationsearch
        #         :path_regex: v2/accounts/[^/]+?/locationsearch
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/searchLocations
        #         :sandbox_only: false
        #       - :action: :show
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations/{locationId}
        #         :path_regex: v2/accounts/[^/]+?/locations/[^/]+??
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/getLocation
        #         :sandbox_only: false
        #       - :action: :update
        #         :method: :put
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/locations/{locationId}
        #         :path_regex: v2/accounts/[^/]+?/locations/[^/]+??
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/updateLocation
        #         :sandbox_only: false
        class Location < Yext::Api::Utils::ApiBase
          include Yext::Api::Concerns::AccountChild

          # http://developer.yext.com/docs/administrative-api/#operation/createExistingLocationAddRequest
          def add_services!(skus:, agreement_id: nil, force_review: false)
            args               = { existingAccountId: account_id, existingLocationId: id }
            args[:skus]        = skus if skus.present?
            args[:agreementId] = agreement_id if agreement_id.present?
            args[:forceReview] = force_review if force_review.present?

            Yext::Api::AdministrativeApi::AddRequest.add_services!(args)
          end

          # http://developer.yext.com/docs/administrative-api/#operation/cancelServices
          def cancel_services!(agreement_id: nil, skus: nil)
            args               = { locationId: id }
            args[:agreementId] = agreement_id if agreement_id.present?
            args[:skus]        = skus if skus.present?

            Yext::Api::AdministrativeApi::Service.cancel_services!(args)
          end
        end
      end
    end
  end
end
