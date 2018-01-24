# frozen_string_literal: true

# :nocov:
module Yext
  module Api
    # The base class for the Engines controllers.
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
# :nocov:
