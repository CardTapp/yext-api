# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module OptimizationTasks
        # :knowledge_api:
        #   :knowledge_manager:
        #     :optimization_link:
        #       - :action: :show
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/optimizationlink
        #         :path_regex: v2/accounts/[^/]+?/optimizationlink
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/getLinkOptimizationTask
        #         :sandbox_only: false
        class OptimizationLink < Yext::Api::Utils::ApiBase
          uri "optimizationlink"

          include Yext::Api::Concerns::AccountChild

          scope :location, ->(location_id) { where(locationId: location_id) }

          scope :task, ->(task_id) { tasks(task_id) }
          scope :tasks, ->(*task_id_array) { where(taskIds: Array.wrap(task_id_array).join(",")) }

          scope :mode, ->(mode) { where(mode: mode) }
        end
      end
    end
  end
end
