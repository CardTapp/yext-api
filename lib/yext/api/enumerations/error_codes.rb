# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # An enumeration class of error codes from Yext
      #
      # http://developer.yext.com/docs/error-messages/
      class ErrorCodes
        include Yext::Api::Concerns::EnumAll

        # Split the constants up into modules to organize the values a bit more
        include Yext::Api::Enumerations::ErrorCodes::AgreementsErrors
        include Yext::Api::Enumerations::ErrorCodes::AnalyticsErrors
        include Yext::Api::Enumerations::ErrorCodes::CustomersErrros
        include Yext::Api::Enumerations::ErrorCodes::EclErrors
        include Yext::Api::Enumerations::ErrorCodes::FeedbackErrors
        include Yext::Api::Enumerations::ErrorCodes::GeneralErrors
        include Yext::Api::Enumerations::ErrorCodes::LiveApiErrors
        include Yext::Api::Enumerations::ErrorCodes::LocationsErrors
        include Yext::Api::Enumerations::ErrorCodes::OptimizationsErrors
        include Yext::Api::Enumerations::ErrorCodes::PublisherSuggestionsErrors
        include Yext::Api::Enumerations::ErrorCodes::ReviewsErrors
        include Yext::Api::Enumerations::ErrorCodes::SocialErrors
        include Yext::Api::Enumerations::ErrorCodes::SubscriptionsErrors
        include Yext::Api::Enumerations::ErrorCodes::SuppressionErrors
        include Yext::Api::Enumerations::ErrorCodes::UsersErrors
      end
    end
  end
end
