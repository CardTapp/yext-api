# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # The base class for the Yext API components.
      class ApiBase < Spyke::Base
        include Yext::Api::Concerns::FaradayConnection
        include Yext::Api::Concerns::DefaultScopes
      end
    end
  end
end
