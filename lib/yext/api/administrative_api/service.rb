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
      #         :sandbox_only: false
      #       - :action: :index
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/services
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/listServices
      #         :sandbox_only: false
      #       - :action: :destroy
      #         :method: :post
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/cancelservices
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/cancelServices
      #         :sandbox_only: false
      class Service < Yext::Api::Utils::ApiBase
        include Yext::Api::Concerns::AccountChild

        scope :available, -> { with(Yext::Api::Concerns::AccountChild.with_account_path("availableservices")) }

        # A method as scope to cancel services for a location.  This feature is here because it is documented
        # in the AdministrativeApi as basically a method on the Service concept.
        #
        # The Location contains an instance method to do this without having to pass in the
        # arguments hash:
        #
        # Some examples of ways to add services:
        #   Yext::Api::AdministrativeApi::Service.cancel_services! locationId: location_id
        #                                                          skus:       [sku]
        #
        #   location = Yext::KnowledgeApi::KnowledgeManager::Location.account(child_account_id).find(location_id)
        #     location.cancel_services! skus: [sku]
        #
        #   location = Yext::KnowledgeApi::KnowledgeManager::Location.new(id: location_id)
        #     location.cancel_services! skus: [sku]
        scope(:cancel_services!, lambda do |cancel_hash|
          args = scope_args(true)

          args.merge!(cancel_hash)

          Yext::Api::AdministrativeApi::Account.
              where(args).
              with(:cancelservices).
              post
        end)
      end
    end
  end
end
