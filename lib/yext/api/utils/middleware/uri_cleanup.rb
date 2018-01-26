# frozen_string_literal: true

module Yext
  module Api
    module Utils
      module Middleware
        # Faraday Middleware for cleaning up after Spyke.
        #
        # I consider this a primary failing of Spyke.  The use of a global "current_scope" and
        # associations being stored in instance variables that are re-used in every single use
        # of the association creates the potential and reality of leaks between calls because
        # scopes don't represent a filter as much as they represent the class itself.
        #
        # Because of this and because there aren't normal hooks on the models, I had to figure out
        # a way to cleanup and reset associations between calls in a reliable manner.
        #
        # Because we're using Faraday, I am using Faraday middleware to hook into the API call
        # and after we get a response, making a call on the class associated with the call that was
        # made and telling that class to clean itself up.
        class UriCleanup < Faraday::Response::Middleware
          def call(env)
            @app.call(env).on_complete do |_environment|
              reset_class_uri(env)

              env.response
            end
          end

          private

          def reset_class_uri(env)
            klass = Yext::Api::Utils::ApiFinder.new(env[:url], env[:method]).find_class_name

            return unless klass.present?

            klass = klass.constantize

            klass.reset_uri if klass.respond_to?(:reset_uri)
          rescue StandardError => error
            return unless Object.const_defined?("Rails")

            Rails.logger.error error
          end
        end
      end
    end
  end
end
