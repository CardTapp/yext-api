# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # Because the Account is listed in the API documentation in two locations, there are two
      # different but somewhat identical Account objects.
      #
      # This module includes the shared code between the two.
      module AccountRelations
        extend ActiveSupport::Concern

        # The module AccountChild will add these relations if they are missing, but if they are
        # listed explicitly it is more efficient.
        included do
          has_many :add_requests,
                   class_name: "Yext::Api::AdministrativeApi::AddRequest",
                   uri:        Yext::Api::Concerns::AccountChild.with_account_path("addrequests/(:id)")
          has_many :locations, class_name: "Yext::Api::KnowledgeApi::KnowledgeManager::Location"
          has_many :services, class_name: "Yext::Api::AdministrativeApi::Service"
        end
      end
    end
  end
end
