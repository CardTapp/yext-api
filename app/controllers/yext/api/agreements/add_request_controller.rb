# frozen_string_literal: true

module Yext
  module Api
    module Agreements
      # This controller processes Yext add_request webhook callbacks.
      #
      # The controller will instrument the "add_request.knowledge_manager.yext" ActiveSupport Notification.
      # The params hash will include:
      #   * meta        - the `meta` value of the webhook.
      #   * add_request - a Yext::Api::AdministrativeApi::AddRequest object that is the AddRequest
      #                   being reported on.

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

          ActiveSupport::Notifications.instrument "add_request.knowledge_manager.yext",
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
