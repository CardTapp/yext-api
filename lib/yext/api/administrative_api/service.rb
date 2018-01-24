# frozen_string_literal: true

module Yext
  module Api
    module AdministrativeApi
      # :administrative_api:
      #   :service:
      #     :actions:
      #       - :action: :available
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/availableservices
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/listAvailableServices
      #         :comment: Return list of services available to you under your agreements.
      #         :sandbox_only: false
      #       - :action: :index
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/services
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/listServices
      #         :comment: Retrieve a list of all services provisioned through this account.
      #         :sandbox_only: false
      #       - :action: :destroy
      #         :method: :post
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/cancelservices
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/cancelServices
      #         :comment: Cancel one or more active services.
      #         :sandbox_only: false
      class Service < Yext::Api::Utils::ApiBase
        include Yext::Api::Concerns::AccountChild

        scope :available, -> { with(Yext::Api::Concerns::AccountChild.with_account_path("availableservices")) }
        scope :cancel_services, -> { with(Yext::Api::Concerns::AccountChild.with_account_path("cancelservices")) }
      end
    end
  end
end
