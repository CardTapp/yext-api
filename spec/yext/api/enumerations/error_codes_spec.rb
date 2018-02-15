# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes.all.count).
          to eq [Yext::Api::Enumerations::ErrorCodes::AgreementsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::AnalyticsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::CustomersErrros.all.count,
                 Yext::Api::Enumerations::ErrorCodes::EclErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::FeedbackErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::GeneralErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::LiveApiErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::LocationsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::OptimizationsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::PublisherSuggestionsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::ReviewsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::SocialErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::SubscriptionsErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::SuppressionErrors.all.count,
                 Yext::Api::Enumerations::ErrorCodes::UsersErrors.all.count].sum
    end

    it "returns all sub statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes.all.sort).
          to eq((Yext::Api::Enumerations::ErrorCodes::AgreementsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::AnalyticsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::CustomersErrros.all +
              Yext::Api::Enumerations::ErrorCodes::EclErrors.all +
              Yext::Api::Enumerations::ErrorCodes::FeedbackErrors.all +
              Yext::Api::Enumerations::ErrorCodes::GeneralErrors.all +
              Yext::Api::Enumerations::ErrorCodes::LiveApiErrors.all +
              Yext::Api::Enumerations::ErrorCodes::LocationsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::OptimizationsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::PublisherSuggestionsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::ReviewsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::SocialErrors.all +
              Yext::Api::Enumerations::ErrorCodes::SubscriptionsErrors.all +
              Yext::Api::Enumerations::ErrorCodes::SuppressionErrors.all +
              Yext::Api::Enumerations::ErrorCodes::UsersErrors.all).sort)
    end
  end
end
