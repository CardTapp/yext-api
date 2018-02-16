# frozen_string_literal: true

module Yext
  module Api
    module KnowledgeApi
      module OptimizationTasks
        # :knowledge_api:
        #   :knowledge_manager:
        #     :optimization_task:
        #       - :action: :index
        #         :method: :get
        #         :endpoint: https://api.yext.com/v2/accounts/{accountId}/optimizationtasks
        #         :path_regex: v2/accounts/[^/]+?/optimizationtasks
        #         :default_version: 20161012
        #         :documentation: http://developer.yext.com/docs/api-reference/#operation/getOptimizationTasks
        #         :sandbox_only: false
        class OptimizationTask < Yext::Api::Utils::ApiBase
          uri default_uri.delete("_")

          include Yext::Api::Concerns::AccountChild

          scope :location, ->(location_id) { locations(location_id) }
          scope :locations, ->(*location_id_array) { where(locationIds: Array.wrap(location_id_array).join(",")) }

          scope :task, ->(task_id) { tasks(task_id) }
          scope :tasks, ->(*task_id_array) { where(taskIds: Array.wrap(task_id_array).join(",")) }
        end
      end
    end
  end
end
