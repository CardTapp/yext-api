# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Concerns::Account do
  class FakeSpyke < Spyke::Base
    include Yext::Api::Concerns::Account
  end

  after(:each) do
    FakeSpyke.current_scope = nil
  end

  around(:each) do |example_proxy|
    original_account_id = Yext::Api.configuration.account_id

    begin
      Yext::Api.configuration.account_id = "testing account_id"
      example_proxy.call
    ensure
      Yext::Api.configuration.account_id = original_account_id
    end
  end

  let(:fake_spyke) { FakeSpyke.new }
  let(:path) { Spyke::Path.new(FakeSpyke.uri, fake_spyke.attributes) }

  it "includes the configured account_id in the path" do
    expect(path.to_s).to be_include("accounts/++/")
  end

  it "includes the passed account_id using with_account" do
    FakeSpyke.current_scope = FakeSpyke.with_account("another account_id")

    expect(path.to_s).to be_include("accounts/+another%20account_id+/")
  end

  it "includes the passed account_id using using where" do
    FakeSpyke.current_scope = FakeSpyke.where(account_id: "yet another account_id")

    expect(path.to_s).to be_include("accounts/+yet%20another%20account_id+/")
  end
end
