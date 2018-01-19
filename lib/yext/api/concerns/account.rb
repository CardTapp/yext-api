# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This concern prepends the `accounts/:account_id/` path to the URI for classes which require it.
      #
      # The account_id can be set in the following ways:
      #   * Global configuration:
      #     * Yext::Api.configuration.account_id = new_account_id
      #   * For an individual call:
      #     * SpykeClass.with_account(new_account_id)
      #     * SpykeClass.where(account_id: new_account_id)
      #
      # NOTE:  This will not work if the DefaultParameters middleware is not being used.
      module Account
        extend ActiveSupport::Concern

        def self.account_path(path)
          File.join("accounts/+(:account_id)+", path)
        end

        included do
          # The pattern /+:account_id+/ will be recognized by the DefaultParameters middleware
          # and replaced with the passed in account_id if it exists or the default specified
          # in Yext::Api.configuration if not.
          uri Yext::Api::Concerns::Account.account_path(default_uri)

          scope(:with_account, ->(account_id) { where(account_id: account_id) })
        end
      end
    end
  end
end
