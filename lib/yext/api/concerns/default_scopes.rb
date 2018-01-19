# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This module adds default scopes that will specify configurations to be overridden for a
      # particular call.
      #
      # If these scopes are used, the values passed in will be used in the API call, if the scope
      # is not used, then the DefaultParameters middleware will insert the default values.
      module DefaultScopes
        extend ActiveSupport::Concern

        included do
          scope(:with_version, ->(version) { where(v: version) })
          scope(:with_application, ->(app_id) { where(api_key: app_id) })
          scope(:yext_username, ->(username) { where(yext_username: username) })
          scope(:yext_user_id, ->(user_id) { where(yext_user_id: user_id) })

          scope(:validate, lambda do |validation = Yext::Api::Enumerations::Validation::STRICT|
            if validation.is_a?(String)
              validation = Yext::Api::Enumerations::Validation::STRICT unless Yext::Api::Enumerations::Validation.all.include?(validation)
            else
              validation = if validation
                             Yext::Api::Enumerations::Validation::STRICT
                           else
                             Yext::Api::Enumerations::Validation::LENIENT
                           end
            end

            where(validation: validation)
          end)
        end
      end
    end
  end
end
