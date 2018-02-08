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
      #     * SpykeClass.account(new_account_id)
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
              next if account_class.association?(klass)

              klass_uri = klass.instance_variable_get(:@uri)
              helper_warnings(account_class, klass, klass_uri)
              klass_uri ||= klass.send(:default_uri)

              add_has_many_relation(account_class, klass, klass_uri)
            end
          end

          def association_name(klass)
            association_name = klass.parents.include?(Yext::Api::LiveApi) ? "live_" : ""

            association_name + klass.model_name.element.pluralize
          end

          private

          def add_has_many_relation(account_class, klass, klass_uri)
            account_class.class_eval do
              has_many Yext::Api::Concerns::AccountChild.association_name(klass).to_sym,
                       class_name: klass.name,
                       uri:        Yext::Api::Concerns::AccountChild.with_account_path(klass_uri)
            end
          end

          def helper_warnings(account_class, klass, klass_uri)
            klass_name    = klass.name
            relation_name = Yext::Api::Concerns::AccountChild.association_name(klass)

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
          scope(:account, lambda do |account_or_id|
            if account_or_id.is_a?(Yext::Api::KnowledgeApi::AccountSettings::Account) ||
                account_or_id.is_a?(Yext::Api::AdministrativeApi::Account)
              account_or_id
            else
              Yext::Api::KnowledgeApi::AccountSettings::Account.new(id: account_or_id)
            end.public_send(Yext::Api::Concerns::AccountChild.association_name(self))
          end)

          Yext::Api::Concerns::AccountChild.ensure_relation(self)
        end

        class_methods do
          def all
            if current_scope.nil?
              Yext::Api::KnowledgeApi::AccountSettings::Account.
                  new(id: Yext::Api.configuration.param_account_id).
                  public_send(Yext::Api::Concerns::AccountChild.association_name(self))
            else
              current_scope
            end
          end

          def reset_uri
            [Yext::Api::KnowledgeApi::AccountSettings::Account, Yext::Api::AdministrativeApi::Account].each do |account_class|
              next unless account_class.association?(self)

              klass_uri = instance_variable_get(:@uri) || default_uri

              account_class.
                  new.
                  send(Yext::Api::Concerns::AccountChild.association_name(self)).
                  with(Yext::Api::Concerns::AccountChild.with_account_path(klass_uri))
            end
          end

          def scope_args(account_scope = false)
            args = current_scope&.params&.dup || {}

            args[:account_id] ||= Yext::Api.configuration.param_account_id

            args[:id] = args.delete(:account_id) if account_scope

            args
          end
        end
      end
    end
  end
end
