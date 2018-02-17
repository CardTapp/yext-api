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
          # AdministrativeApi
          has_many :add_requests,
                   class_name: "Yext::Api::AdministrativeApi::AddRequest",
                   uri:        Yext::Api::Concerns::AccountChild.with_account_path("addrequests/(:id)")
          has_many :services, class_name: "Yext::Api::AdministrativeApi::Service"

          # KnowledgeApi::KnowledgeManager
          has_many :locations, class_name: "Yext::Api::KnowledgeApi::KnowledgeManager::Location"

          # KnowledgeApi::AccountSettings
          has_many :users, class_name: "Yext::Api::KnowledgeApi::AccountSettings::User"
          has_many :roles, class_name: "Yext::Api::KnowledgeApi::AccountSettings::Role"

          # KnowledgeApi::OptimizationTasks
          has_many :optimization_tasks,
                   class_name: "Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask",
                   uri:        Yext::Api::Concerns::AccountChild.with_account_path("optimizationtasks/(:id)")
          has_many :optimization_links,
                   class_name: "Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink",
                   uri:        Yext::Api::Concerns::AccountChild.with_account_path("optimizationlink")

          # LiveApi
          has_many :live_locations, class_name: "Yext::Api::LiveApi::Location"

          after_save :save_account_id
        end

        # rubocop:disable Naming/MethodName

        # Yext field names don't match the Ruby naming standard, this is the field name they use.
        # Because I use `account_id` in the route, I need that attribute defined.  Because
        # Yext uses accountId, when it is set, I need to set `account_id` so they will match.
        def accountId=(value)
          super
          attributes[:account_id] ||= value
        end

        # rubocop:enable Naming/MethodName

        private

        def save_account_id
          attributes[:account_id] = accountId
        end

        class_methods do
          def association?(klass)
            associations.key?(Yext::Api::Concerns::AccountChild.association_name(klass).to_sym)
          end
        end
      end
    end
  end
end
