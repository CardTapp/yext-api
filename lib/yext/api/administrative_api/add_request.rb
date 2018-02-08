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
      #         :sandbox_only: false
      #       - :action: :show
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/addrequests/{addRequestId}
      #         :path_regex: v2/accounts/[^/]+?/addrequests/[^/]+??
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/getAddRequest
      #         :sandbox_only: false
      #       - :action: :create
      #         :method: :post
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/newlocationaddrequests
      #         :path_regex: v2/accounts/\w+/newlocationaddrequests
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/createNewLocationAddRequest
      #         :sandbox_only: false
      #       - :action: :update
      #         :method: :post
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/processaddrequest
      #         :path_regex: v2/accounts/\w+/processaddrequest
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/createProcessReviewAddRequest
      #         :sandbox_only: true
      #       - :action: :add_services
      #         :method: :post
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/existinglocationaddrequests
      #         :path_regex: v2/accounts/\w+/existinglocationaddrequests
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/createExistingLocationAddRequest
      #         :sandbox_only: false
      class AddRequest < Yext::Api::Utils::ApiBase
        uri("addrequests/(:id)")

        include Yext::Api::Concerns::AccountChild

        # This is a helper method to try to simplify changing the status of an AddRequest if you
        # don't have an AddRequest object.
        #
        # Some examples of ways to change a status:
        #   Yext::Api::AdministrativeApi::AddRequest.change_status!(request_id, Yext::Api::Enumerations::AddRequestStatus::COMPLETE)
        #   Yext::Api::AdministrativeApi::AddRequest.new(id: request_id, status: Yext::Api::Enumerations::AddRequestStatus::COMPLETE).save
        #   add_request = Yext::Api::AdministrativeApi::AddRequest.find(request_id)
        #     add_request.status = Yext::Api::Enumerations::AddRequestStatus::COMPLETE)
        #     add_request.save
        def self.change_status!(request_id, new_status)
          raise InvalidArgument "invalid status" unless Yext::Api::Enumerations::AddRequestStatus.all.include?(new_status)

          new(id: request_id, status: new_status).save
        end

        # A method as scope to add services to an AddRequest.  This feature is here because it is documented
        # in the AdministrativeApi as basically a method on the AddRequest concept.
        #
        # The Location contains an instance method to do this without having to pass in the
        # arguments hash:
        #
        # Some examples of ways to add services:
        #   Yext::Api::AdministrativeApi::AddRequest.add_services! existingLocationId:        location_id
        #                                                          existingLocationAccountId: child_account_id,
        #                                                          skus:                      [sku]
        #
        #   location = Yext::KnowledgeApi::KnowledgeManager::Location.account(child_account_id).find(location_id)
        #     location.add_services! skus: [sku]
        #
        #   location = Yext::KnowledgeApi::KnowledgeManager::Location.new(account_id: child_account_id, id: location_id)
        #     location.add_services! skus: [sku]
        scope(:add_services!, lambda do |location_update_hash = {}|
          args = scope_args(true)

          args.merge!(location_update_hash)

          Yext::Api::AdministrativeApi::Account.
              where(args).
              with(:existinglocationaddrequests).
              post
        end)

        def save
          if persisted?
            change_status
          else
            create_new_location
          end
        end

        private

        def create_new_location
          scope.
              with(Yext::Api::Concerns::AccountChild.with_account_path("newlocationaddrequests")).
              where(attributes.reverse_merge(account_id: Yext::Api.configuration.param_account_id)).
              post
        end

        def change_status
          scope.
              with(Yext::Api::Concerns::AccountChild.with_account_path("processaddrequest")).
              where(addRequestId: id, status: status).
              post
        end
      end
    end
  end
end
