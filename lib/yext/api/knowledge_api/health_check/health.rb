# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module HealthCheck
        # :knowledge_api:
        #   :health_check:
        #     :health:
        #       :actions:
        #         - :action: :index
        #           :method: :get
        #           :endpoint: https://api.yext.com/v2/healthy
        #           :path_regex: v2/healthy
        #           :default_version: 20161012
        #           :documentation: http://developer.yext.com/docs/api-reference/#operation/healthCheck
        #           :comment: The Health Check endpoint allows you to monitor the status of Yext's systems.
        #           :sandbox_only: false
        class Health < Yext::Api::Utils::ApiBase
          uri("healthy")
        end
      end
    end
  end
end
