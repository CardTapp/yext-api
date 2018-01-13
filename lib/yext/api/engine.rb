# frozen_string_literal: true

module Yext
  module Api
    # The base engine class for the API.
    class Engine < ::Rails::Engine
      isolate_namespace Yext::Api
    end
  end
end
