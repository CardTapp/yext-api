# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module KnowledgeManager
        # :knowledge_api:
        #   :knowledge_manager:
        #     :category:
        #       :actions:
        #         - :action: :index
        #           :method: :get
        #           :endpoint: https://api.yext.com/v2/categories
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/getBusinessCategories
        #           :comment: Get available Categories.
        #           :sandbox_only: false
        #
        # Class for fetching categories
        class Category < Yext::Api::Utils::ApiBase
        end
      end
    end
  end
end
