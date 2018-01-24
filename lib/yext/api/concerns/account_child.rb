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
      #
      # If the class that this is included in uses a custom URI, the `uri` call must be made before this
      # module is included.
      module AccountChild
        extend ActiveSupport::Concern

        class << self
          def with_account_path(path)
            File.join("accounts/:account_id", path)
          end

          def ensure_relation(klass)
            [Yext::Api::KnowledgeApi::AccountSettings::Account, Yext::Api::AdministrativeApi::Account].each do |account_class|
              next if account_class.instance_methods.include?("#{klass.model_name.element}_ids".to_sym)

              klass_uri = klass.instance_variable_get(:@uri)
              helper_warnings(account_class, klass, klass_uri)
              klass_uri ||= klass.send(:default_uri)

              add_has_many_relation(account_class, klass, klass_uri)
            end
          end

          private

          def add_has_many_relation(account_class, klass, klass_uri)
            account_class.class_eval do
              has_many klass.model_name.element.pluralize.to_sym,
                       class_name: klass.name,
                       uri:        Yext::Api::Concerns::AccountChild.with_account_path(klass_uri)
            end
          end

          def helper_warnings(account_class, klass, klass_uri)
            klass_name    = klass.name
            relation_name = klass.model_name.element.pluralize

            puts "WARNING! #{account_class.name} does not include the relationship for #{klass_name}"
            puts " Add the following line to Yext::Api::Concerns::AccountRelations:"

            if klass_uri && klass_uri != klass.send(:default_uri)
              puts "   has_many :#{relation_name}, class_name: \"#{klass_name}\", " \
                       "uri: Yext::Api::Concerns::AccountChild.with_account_path(\"#{klass_uri}\")"
            else
              puts "   has_many :#{relation_name}, class_name: \"#{klass_name}\""
            end
          end
        end

        included do
          scope(:with_account, lambda do |account_or_id|
            if account_or_id.is_a?(Yext::Api::KnowledgeApi::AccountSettings::Account) ||
                account_or_id.is_a?(Yext::Api::AdministrativeApi::Account)
              account_or_id
            else
              Yext::Api::KnowledgeApi::AccountSettings::Account.new(id: account_or_id)
            end.public_send(model_name.element.pluralize)
          end)

          Yext::Api::Concerns::AccountChild.ensure_relation(self)
        end

        class_methods do
          def all
            if current_scope.nil?
              Yext::Api::KnowledgeApi::AccountSettings::Account.
                  new(id: Yext::Api.configuration.account_id || "me").
                  public_send(model_name.element.pluralize)
            else
              current_scope
            end
          end
        end
      end
    end
  end
end
