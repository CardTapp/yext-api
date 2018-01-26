# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # The base class for the Yext API components.
      class ApiBase < Spyke::Base
        include Yext::Api::Concerns::FaradayConnection
        include Yext::Api::Concerns::DefaultScopes

        before_save :ensure_create_id

        private

        def ensure_create_id
          attributes[:create_id] ||= attributes[:id]
        end
      end
    end
  end
end
