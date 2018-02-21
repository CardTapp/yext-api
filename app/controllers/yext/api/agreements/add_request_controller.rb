# frozen_string_literal: true

module Yext
  module Api
    module Agreements
      # This controller processes Yext add_request webhook callbacks.
      #
      # The controller will call the add_request_changed function on the configured class
      # for the add_request_changed function.

      # :webhooks:
      #   :agreements:
      #     :add_request_update:
      #       :endpoint: https://[your_hostname]/[your_add_request_webhook_path]
      #       :default_version: 20161012
      #       :documentation: http://developer.yext.com/docs/webhooks/#operation/addRequestWebhook
      #       :sandbox_only: false
      class AddRequestController < Yext::Api::ApplicationController
        extend Memoist

        def create
          add_request = Yext::Api::AdministrativeApi::AddRequest.new(add_request_hash[:addRequest])

          ActiveSupport::Notifications.instrument "add_request.changed.yext",
                                                  meta:        add_request_hash[:meta],
                                                  add_request: add_request do
            # do your custom stuff here
          end

          head :ok
        end

        private

        # rubocop:disable MethodLength

        def add_request_hash
          params.
              permit(meta:       %i[eventType uuid timestamp accountId actor appSpecificAccountId],
                     addRequest: [:id,
                                  :locationMode,
                                  :existingLocationId,
                                  :newLocationId,
                                  :newLocationAccountId,
                                  :newAccountParentAccountId,
                                  :newLocationData,
                                  { skus: [] },
                                  :agreementId,
                                  :status,
                                  :dateSubmitted,
                                  :dateCompleted,
                                  :statusDetail]).
              to_hash.
              with_indifferent_access
        end

        # rubocop:enable MethodLength

        memoize :add_request_hash
      end
    end
  end
end
