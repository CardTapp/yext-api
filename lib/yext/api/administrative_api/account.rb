# frozen_string_literal: true

module Yext
  module Api
    module AdministrativeApi
      # :administrative_api:
      #   :objects:
      #     :account:
      #       :actions:
      #         - :action: :create
      #           :method: :post
      #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/newlocationaddrequests
      #           :path_regex: v2/accounts/\w+/newlocationaddrequests
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/createNewLocationAddRequest
      #           :comment: Request that a new location be added and services added to it. The location is created only if the request succeeds.
      #           :sandbox_only: false
      #         - :action: :add_services
      #           :method: :post
      #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/existinglocationaddrequests
      #           :path_regex: v2/accounts/\w+/existinglocationaddrequests
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/createExistingLocationAddRequest
      #           :comment: Request that one or more available services be added to an existing location.
      #           :sandbox_only: false
      #         - :action: :change_status
      #           :method: :post
      #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/processaddrequest
      #           :path_regex: v2/accounts/\w+/processaddrequest
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/createProcessReviewAddRequest
      #           :comment: Request that an add request in REVIEW be processed to COMPLETE, CANCELED, or FAILED.
      #           :sandbox_only: true
      #         - :action: :index
      #           :method: :get
      #           :endpoint: https://api.yext.com/v2/accounts
      #           :path_regex: v2/accounts
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/listAccounts
      #           :comment: List all accounts that you have access to. Unless you are in Partner Portal mode, this will only be your own account.
      #           :sandbox_only: false
      #         - :action: :show
      #           :method: :get
      #           :endpoint: https://api.yext.com/v2/accounts/{accountId}
      #           :path_regex: v2/accounts/\w+
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/getAccount
      #           :comment: Get details for an account.
      #           :sandbox_only: false
      #         - :action: :update
      #           :method: :put
      #           :endpoint: https://api.yext.com/v2/accounts/{accountId}
      #           :path_regex: v2/accounts/\w+
      #           :default_version: 20161012
      #           :documentation: http://developer.yext.com/docs/administrative-api/#operation/updateAccount
      #           :comment: Update an account's name or ID.
      #           :sandbox_only: false
      class Account < Yext::Api::Utils::ApiBase
      end
    end
  end
end
