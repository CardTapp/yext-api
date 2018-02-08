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
          process_add_request_changed

          head :ok
        end

        private

        def process_add_request_changed
          processor = Yext::Api.configuration.get_callback_processor(:add_request_changed)

          return if processor.blank?

          processor.new(processor_args[:meta],
                        Yext::Api::AdministrativeApi::AddRequest.new(processor_args[:addRequest]),
                        nil).
              add_request_changed
        end

        def processor_args
          params_hash.convert_epoch :meta, :timestamp
          params_hash.convert_time :addRequest, :dateSubmitted
          params_hash.convert_time :addRequest, :dateCompleted

          params_hash.params
        end

        # rubocop:disable MethodLength

        def params_hash
          Yext::Api::Utils::Params.
              new(params.
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
                  with_indifferent_access)
        end

        # rubocop:enable MethodLength

        memoize :processor_args,
                :params_hash
      end
    end
  end
end
