# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This module add the `find_api` method to a class to allow the searching of the base
      # api category module for a particular route.
      module ApiFinder
        def find_api(url, method)
          return if url.nil? || method.nil?
          return Yext::Api::LiveApi if url.host.include?("liveapi")

          hash = YAML.load_file(Yext::Api::Engine.root.join("lib/config/api.yml"))

          hash.each_key do |hash_key|
            guess_api = api_from_key(hash_key)

            next if guess_api.blank?

            return guess_api if found_route?(hash[hash_key], url.path, method.to_s)
          end

          nil
        end

        private

        def found_route?(hash, path, method)
          hash.each do |key_name, sub_hash|
            if sub_hash.is_a?(Hash)
              return true if found_route?(sub_hash, path, method)
            elsif key_name == :actions
              return true if found_action?(sub_hash, path, method)
            end
          end

          false
        end

        def found_action?(actions, path, method)
          actions.each do |action|
            next if action[:path_regex].blank?
            next if action[:method].to_s != method

            return true if Regexp.new("#{action[:path_regex]}$").match(path)
          end

          false
        end

        def api_from_key(hash_key)
          "Yext::Api::#{hash_key.to_s.classify}".constantize
        rescue NameError
          # :nocov:
          nil
          # :nocov:
        end
      end
    end
  end
end
