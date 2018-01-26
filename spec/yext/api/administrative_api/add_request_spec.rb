# frozen_string_literal: true

require "rails_helper"

# test notes:
#
# Because of the nature of Yext API and that you cannot cleanup test objects after they are created
# we cannot re-record these tests once they have been recorded in VCR without changing the IDs.
#
# Additionally, I use the results of some tests in other tests.  These dependencies will be noted
# as best I can in the tests.
RSpec.describe Yext::Api::AdministrativeApi::AddRequest, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::AddRequest.all.to_a }

    it "gets a list of add_requests" do
      Yext::Api::AdministrativeApi::AddRequest.uri
      add_requests = Yext::Api::AdministrativeApi::AddRequest.all.to_a

      expect(add_requests.length).to be_positive
      expect(add_requests.first.locationMode).to be_present
    end
  end

  # 224757 is a request from one of the `create` tests.
  describe "show" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::AddRequest.find("224757") }

    it "gets an add_requests" do
      add_requests = Yext::Api::AdministrativeApi::AddRequest.find("224757")

      expect(add_requests.locationMode).to be_present
    end
  end

  # Tests cannot be re-recorded without changing IDs.
  describe "create" do
    it "creates a new account using save" do
      account = Yext::Api::AdministrativeApi::AddRequest.new

      account.newLocationId          = "my-test-location-id-1"
      account.newLocationAccountId   = "my-test-account-id-1"
      account.newLocationAccountName = "RSpec Test Account 1"
      account.skus                   = ["DEV-00010000"]
      account.forceReview            = true
      account.newLocationData        = { id:                 "my-test-location-id-1",
                                         locationType:       "LOCATION",
                                         locationName:       "RSpec Test Location 1",
                                         address:            "1313 Mockingbird Ln.",
                                         address2:           "Suite 100",
                                         suppressAddress:    true,
                                         city:               "Anchorage",
                                         state:              "AK",
                                         zip:                "90210",
                                         phone:              "425-555-1212",
                                         categoryIds:        ["1146752"],
                                         featuredMessage:    "This is so cool!",
                                         featuredMessageUrl: "https://www.cardtapp.com/buy",
                                         websiteUrl:         "https://www.cardtapp.com",
                                         description:        "My cool RSpec location",
                                         emails:             ["1@1.com"] }

      account.save

      expect(Yext::Api::AdministrativeApi.last_status).to eq 200
    end

    it "creates a new account using create" do
      Yext::Api::AdministrativeApi::AddRequest.
          create(newLocationId:          "my-test-location-id-2",
                 newLocationAccountId:   "my-test-account-id-2",
                 newLocationAccountName: "RSpec Test Account 2",
                 skus:                   ["DEV-00010000"],
                 forceReview:            true,
                 newLocationData:        { id:                 "my-test-location-id-2",
                                           locationType:       "LOCATION",
                                           locationName:       "RSpec Test Location 2",
                                           address:            "2756 Morning glory Cir.",
                                           address2:           "Suite 200",
                                           suppressAddress:    true,
                                           city:               "Boston",
                                           state:              "AL",
                                           zip:                "90410",
                                           phone:              "425-555-1211",
                                           categoryIds:        ["1146752"],
                                           featuredMessage:    "This is so cool too!",
                                           featuredMessageUrl: "https://www.cardtapp.com/buy",
                                           websiteUrl:         "https://www.cardtapp.com",
                                           description:        "My cool RSpec location",
                                           emails:             ["2@2.com"] })

      expect(Yext::Api::AdministrativeApi.last_status).to eq 200
    end
  end

  # 224757 is a request from one of the `create` tests.
  # Once this test is run, it cannot be run again on the same add request.
  describe "change_status" do
    it "changes the status to COMPLETE" do
      add_request = Yext::Api::AdministrativeApi::AddRequest.find("224757")

      expect(add_request.status).not_to eq Yext::Api::Enumerations::AddRequestStatus::COMPLETE
      add_request.status = Yext::Api::Enumerations::AddRequestStatus::COMPLETE

      expect { Yext::Api::AdministrativeApi::Account.find(add_request.newLocationAccountId) }.to raise_error Spyke::ResourceNotFound

      add_request.save

      account = Yext::Api::AdministrativeApi::Account.find(add_request.newLocationAccountId)
      expect(account.accountName).to eq add_request.newLocationAccountName
    end

    # use the same cassette as the other test since the tests are the same except for how the call is made.
    it "changes the status to COMPLETE through change_status function",
       vcr: { cassette_name: "Yext_Api_AdministrativeApi_AddRequest/change_status/changes_the_status_to_COMPLETE" } do
      add_request = Yext::Api::AdministrativeApi::AddRequest.find("224757")

      expect(add_request.status).not_to eq Yext::Api::Enumerations::AddRequestStatus::COMPLETE
      add_request.status = Yext::Api::Enumerations::AddRequestStatus::COMPLETE

      expect { Yext::Api::AdministrativeApi::Account.find(add_request.newLocationAccountId) }.to raise_error Spyke::ResourceNotFound

      Yext::Api::AdministrativeApi::AddRequest.change_status! add_request.id, add_request.status

      account = Yext::Api::AdministrativeApi::Account.find(add_request.newLocationAccountId)
      expect(account.accountName).to eq add_request.newLocationAccountName
    end
  end

  describe "add_services!" do
    before(:each) do
      Yext::Api::AdministrativeApi::Service.cancel_services!(locationId: "my-test-location-id-2")
    end

    it "adds services to an existing location" do
      expect do
        Yext::Api::AdministrativeApi::AddRequest.add_services!(existingLocationId:        "my-test-location-id-2",
                                                               existingLocationAccountId: "my-test-account-id-2",
                                                               skus:                      ["DEV-00010000"])
      end.to(change { Yext::Api::AdministrativeApi::Service.all.to_a.count }.by(1))
    end

    it "can be called from a location" do
      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").find("my-test-location-id-2")

      location.add_services! skus: ["DEV-00010000"]
    end
  end
end
