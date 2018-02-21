# frozen_string_literal: true

module Yext
  module Api
    module AdministrativeApi
      # :administrative_api:
      #   :account:
      #     :actions:
      #       - :action: :index
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts
      #         :path_regex: v2/accounts
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/listAccounts
      #         :sandbox_only: false
      #       - :action: :show
      #         :method: :get
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}
      #         :path_regex: v2/accounts/\w+
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/getAccount
      #         :sandbox_only: false
      #       - :action: :update
      #         :method: :put
      #         :endpoint: https://api.yext.com/v2/accounts/{accountId}
      #         :path_regex: v2/accounts/\w+
      #         :default_version: 20161012
      #         :documentation: http://developer.yext.com/docs/administrative-api/#operation/updateAccount
      #         :sandbox_only: false
      class Account < Yext::Api::Utils::ApiBase
        include Yext::Api::Concerns::AccountRelations

        # The save action only allows the saving of the account_id and the accountName
        #
        # Furthermore, the account_id cannot be changed by the partner, but only by the customer
        # themselves.
        def save
          return unless Yext::Api::Validators::AccountValidator.new(self).valid?

          updates             = { account_id: account_id, accountName: accountName }
          updates[:accountId] = accountId if accountId != account_id

          scope.with(Yext::Api::Concerns::AccountChild.with_account_path("")).
              where(updates).
              put

          save_account_id
        end
      end
    end
  end
end
