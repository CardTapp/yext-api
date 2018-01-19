# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This concern adds an `all` method to an enumeration class to list all constants in that class.
      module EnumAll
        extend ActiveSupport::Concern

        class_methods do
          def all
            (constants - %i[ClassMethods]).map { |c| const_get(c) }
          end
        end
      end
    end
  end
end
