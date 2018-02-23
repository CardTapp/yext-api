# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module Powerlistings
        # :knowledge_api:
        #   :powerlistings:
        #     :listing:
        #       - :action: :index
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/powerlistings/listings
        #         :path_regex: v2/accounts/[^/]+?/powerlistings/listings
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/listListings
        #         :sandbox_only: false
        #       - :action: :opt_in
        #         :method: :put
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/powerlistings/listings/optin
        #         :path_regex: v2/accounts/[^/]+?/powerlistings/listings/optin
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/optInListings
        #         :sandbox_only: false
        #       - :action: :opt_out
        #         :method: :put
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/powerlistings/listings/optout
        #         :path_regex: v2/accounts/[^/]+?/powerlistings/listings/optout
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/optOutListings
        #         :sandbox_only: false
        class Listing < Yext::Api::Utils::ApiBase
          uri "powerlistings/#{default_uri}"

          include Yext::Api::Concerns::AccountChild

          # rubocop:disable Style/Lambda

          scope(:opt_in!, ->(location_ids: nil, publisher_ids: nil) do
            params                = {}
            params[:locationIds]  = Array.wrap(location_ids).join(",") if location_ids.present?
            params[:publisherIds] = Array.wrap(publisher_ids).join(",") if publisher_ids.present?

            where(params).with(:optin).put
          end)

          scope(:opt_out!, ->(location_ids: nil, publisher_ids: nil) do
            params                = {}
            params[:locationIds]  = Array.wrap(location_ids) if location_ids.present?
            params[:publisherIds] = Array.wrap(publisher_ids) if publisher_ids.present?

            where(params).with(:optout).put
          end)

          # rubocop:enable Style/Lambda
        end
      end
    end
  end
end
