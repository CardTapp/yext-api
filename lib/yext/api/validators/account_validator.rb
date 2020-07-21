# frozen_string_literal: true

module Yext
  module Api
    module Validators
      # A Validator for account updates to verify that the update is valid.
      class AccountValidator < ::Validation::Validator
        include ::Validation
        extend ::Validation::Rules

        def initialize(obj)
          # Ensure that the accountId field exists by cloning the Account and setting it.
          obj           = Yext::Api::AdministrativeApi::Account.new(obj.attributes)
          obj.accountId = obj[:accountId]

          super(obj)
        end

        rule :accountId, :not_empty
      end
    end
  end
end
