# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module AccountSettings
        # :administrative_api:
        #   :account_settings:
        #     :role:
        #       :actions:
        #        - :action: :index
        #          :method: :get
        #          :endpoint: https://api.yext.com/v2/accounts/{accountId}/roles
        #          :path_regex: v2/accounts/[^/]+?/roles
        #          :default_version: 20161012
        #          :documentation: http://developer.yext.com/docs/api-reference/#operation/getRoles
        #          :sandbox_only: false
        class Role < Yext::Api::Utils::ApiBase
          include Yext::Api::Concerns::AccountChild
        end
      end
    end
  end
end
