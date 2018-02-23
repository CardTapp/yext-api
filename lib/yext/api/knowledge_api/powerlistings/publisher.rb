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
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/powerlistings/publishers
        #         :path_regex: v2/accounts/[^/]+?/powerlistings/publishers
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/listPublishers
        #         :sandbox_only: false
        class Publisher < Yext::Api::Utils::ApiBase
          uri "powerlistings/#{default_uri}"

          include Yext::Api::Concerns::AccountChild
        end
      end
    end
  end
end
