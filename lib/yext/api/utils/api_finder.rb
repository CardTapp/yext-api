# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # This module add the `find_api` method to a class to allow the searching of the base
      # api category module for a particular route.
      class ApiFinder
        class << self
          def api_hash
            @api_hash ||= YAML.load_file(Yext::Api::Engine.root.join("lib/config/api.yml"))
          end
        end

        def initialize(uri_path, uri_method)
          uri       = URI.parse(uri_path.to_s)
          uri.query = nil

          @uri_path   = uri.to_s
          @uri_method = uri_method.to_s
        end

        def find_api
          api = find_class_name.to_s.split("::")

          return nil if api.length < 3

          "Yext::Api::#{api[2]}".constantize
        end

        def find_class_name
          api_hash = Yext::Api::Utils::ApiFinder.api_hash

          return build_class_name("Yext::Api::LiveApi", api_hash[:live_api]) if uri_path.include?("//liveapi.")

          api_hash.each do |api_class, module_details|
            next if api_class == :webhooks

            found_class = build_class_name("Yext::Api::#{api_class.to_s.classify}", module_details)

            return found_class if found_class.present?
          end

          nil
        end

        private

        attr_accessor :uri_path,
                      :uri_method

        def build_class_name(built_name, module_details)
          module_details.each do |sub_detail_name, sub_detail|
            found_class = find_class_in_module(built_name, sub_detail_name, sub_detail)

            return found_class unless found_class.nil?
          end

          nil
        end

        def find_class_in_module(built_name, sub_detail_name, sub_detail)
          possible_name = construct_build_name(built_name, sub_detail_name)

          if sub_detail_name == :objects
            sub_detail.each do |class_name, class_actions|
              return "#{possible_name}::#{class_name.to_s.classify}" if action_found?(class_actions[:actions])
            end

            nil
          elsif sub_detail.is_a?(Hash)
            build_class_name(possible_name, sub_detail)
          end
        end

        def construct_build_name(built_name, sub_detail_name)
          return built_name if %i[documentation objects].include?(sub_detail_name)

          "#{built_name}::#{sub_detail_name.to_s.classify}"
        end

        def action_found?(actions)
          return false if actions.blank?

          actions.each do |action|
            next if action[:path_regex].blank?
            next if action[:method].to_s != uri_method

            return true if Regexp.new("#{action[:path_regex]}$").match(uri_path)
          end

          false
        end
      end
    end
  end
end
