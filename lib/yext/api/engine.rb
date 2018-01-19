# frozen_string_literal: true

module Yext
  module Api
    # The base engine class for the API.
    class Engine < ::Rails::Engine
      isolate_namespace Yext::Api

      # Add a load path for this specific Engine
      config.autoload_paths << File.expand_path("../../../../lib", __FILE__)
    end
  end
end
