# frozen_string_literal: true

module Yext
  module Api
    module Powerlistings
      # This controller processes Yext listing webhook callbacks.
      #
      # The controller will instrument the "listing.powerlistings.yext" ActiveSupport Notification.
      # The params hash will include:
      #   * meta    - the `meta` value of the webhook.
      #   * listing - a Yext::Api::KnowledgeApi::Powerlistings::Listing object that is the Listing
      #               being reported on.

      # :webhooks:
      #   :listing:
      #     :endpoint: https://[your_hostname]/[your_listings_webhook_path]
      #     :default_version: 20161012
      #     :documentation: http://developer.yext.com/docs/webhooks/#operation/listingsWebhook
      #     :sandbox_only: false
      class ListingController < Yext::Api::ApplicationController
        extend Memoist

        def create
          listing = Yext::Api::KnowledgeApi::Powerlistings::Listing.new(listing_hash[:listing])

          ActiveSupport::Notifications.instrument "listing.powerlistings.yext",
                                                  meta:    listing_hash[:meta],
                                                  listing: listing do
            # do your custom stuff here
          end

          head :ok
        end

        private

        # rubocop:disable MethodLength

        def listing_hash
          params.
              permit(meta:    %i[eventType uuid timestamp accountId actor appSpecificAccountId],
                     listing: [:id,
                               :locationId,
                               :publisherId,
                               :status,
                               :additionalStatus,
                               :listingUrl,
                               :loginUrl,
                               :screenshotUrl,
                               { statusDetails: %i[code message type] },
                               { alternateBrands: %i[brandName listingUrl] }]).
              to_hash.
              with_indifferent_access
        end

        # rubocop:enable MethodLength

        memoize :listing_hash
      end
    end
  end
end
