# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # A utility class for performing normal modifications to webhooks to convert/normalize data
      # before passing it along so that the receiver doesn't have to worry/thnk about it.
      class Params
        attr_reader :params

        def initialize(params)
          @params = params
        end

        # Converts an integer epoch date value into a Time.
        #
        # The param_names is a list of nodes which ends with a leaf node that is the epoch value
        # to be converted to a Time.
        #
        # If any node along the way cannot be found, the function exits without errors or changing any values.
        def convert_epoch(*param_names)
          return unless param_names.present?

          param_name  = param_names[-1]
          param_level = find_value(*param_names)

          return unless param_level.present?

          param_level[param_name] = Time.at(param_level[param_name].to_i / 1_000.0)
        end

        # Converts time string into a Time.
        #
        # The param_names is a list of nodes which ends with a leaf node that is the time string
        # to be converted to a Time.
        #
        # If any node along the way cannot be found, the function exits without errors or changing any values.
        def convert_time(*param_names)
          return unless param_names.present?

          param_name  = param_names[-1]
          param_level = find_value(*param_names)

          return unless param_level.present?

          param_level[param_name] = param_level[param_name].to_time(:utc)
        end

        private

        def find_value(*param_names)
          param_level = params
          found_param = param_names[0..-2].each do |param_name|
            break unless param_level.key?(param_name)

            param_level = param_level[param_name]
          end

          return if found_param.nil?

          param_name = param_names[-1]
          return unless param_level.key?(param_name) && param_level[param_name].present?

          param_level
        end
      end
    end
  end
end
