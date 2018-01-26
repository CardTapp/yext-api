# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module AccountSettings
        # :administrative_api:
        #   :account_settings:
        #     :user:
        #       :actions:
        #         - :action: :index
        #           :method: :get
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users
        #           :path_regex: v2/accounts/[^/]+?/users
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/getUsers
        #           :sandbox_only: false
        #         - :action: :create
        #           :method: :post
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users
        #           :path_regex: v2/accounts/[^/]+?/users
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/createUser
        #           :sandbox_only: false
        #         - :action: :show
        #           :method: :get
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users/{userId}
        #           :path_regex: v2/accounts/[^/]+?/users/[^/]+?
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/getUser
        #           :sandbox_only: false
        #         - :action: :update
        #           :method: :put
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users/{userId}
        #           :path_regex: v2/accounts/[^/]+?/users/[^/]+?
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/updateUser
        #           :sandbox_only: false
        #         - :action: :destroy
        #           :method: :delete
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users/{userId}
        #           :path_regex: v2/accounts/[^/]+?/users/[^/]+?
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/deleteUser
        #           :sandbox_only: false
        #         - :action: :change_password
        #           :method: :put
        #           :endpoint: https://api.yext.com/v2/accounts/{accountId}/users/{userId}/password
        #           :path_regex: v2/accounts/[^/]+?/users/[^/]+?/password
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/updateUserPassword
        #           :sandbox_only: false
        class User < Yext::Api::Utils::ApiBase
          include Yext::Api::Concerns::AccountChild

          # Helper method to change password without a User object.
          #
          # Some example ways to change a password:
          #   Yext::Api::KnowledgeApi::AccountSettings::User.account(account_id).where(id: user_id).change_password!(new_password)
          #   Yext::Api::KnowledgeApi::AccountSettings::User.new(id: user_id, account_id: account_id).change_password!(new_password)
          #   user = Yext::Api::KnowledgeApi::AccountSettings::User.account(account_id).find(user_id)
          #     user.change_password!(new_password)
          scope(:change_password!, lambda do |new_password|
            args = scope_args

            args[:newPassword] = new_password

            Yext::Api::KnowledgeApi::AccountSettings::User.
                where(args).
                with(:password).
                put
          end)

          def change_password!(new_password)
            self.class.where(id: id, account_id: account_id).change_password!(new_password)
          end
        end
      end
    end
  end
end
