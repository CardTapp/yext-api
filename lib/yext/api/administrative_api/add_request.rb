# frozen_string_literal: true

# TODO: Complete and test.  Untested initial framework class.
module Yext
  module Api
    module AdministrativeApi
      # :administrative_api:
      #   :add_request:
      #     :actions:
      #       - :action: :index
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/addrequests
      #         :path_regex: v2/accounts/[^/]+?/addrequests
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/listAddRequests
      #         :comment: Get all of the add requests in the account. The response includes both New Location
      #                   Add Requests and Existing Location Add Requests.
      #         :sandbox_only: false
      #       - :action: :show
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/addrequests/{addRequestId}
      #         :path_regex: v2/accounts/[^/]+?/addrequests/[^/]+??
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/getAddRequest
      #         :comment: Get status information about an add request previously created.
      #         :sandbox_only: false
      class AddRequest < Yext::Api::Utils::ApiBase
        uri("addrequests/(:id)")

        include Yext::Api::Concerns::AccountChild
      end
    end
  end
end
