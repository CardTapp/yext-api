# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module AccountSettings
        # :administrative_api:
        #   :account_settings:
        #     :account:
        #       :actions:
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
        class Account < Yext::Api::Utils::ApiBase
          include Yext::Api::Concerns::AccountRelations
        end
      end
    end
  end
end
