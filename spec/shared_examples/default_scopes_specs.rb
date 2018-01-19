# frozen_string_literal: true

RSpec.shared_examples("default scopes") do
  it "has the with_version scope" do
    scope = described_class.all.with_version("my version")

    expect(scope.params[:v]).to eq "my version"
  end

  it "has the with_application scope" do
    scope = described_class.all.with_application("my application")

    expect(scope.params[:api_key]).to eq "my application"
  end

  it "has the yext_username scope" do
    scope = described_class.all.yext_username("my user name")

    expect(scope.params[:yext_username]).to eq "my user name"
  end

  it "has the yext_user_id scope" do
    scope = described_class.all.yext_user_id("my user id")

    expect(scope.params[:yext_user_id]).to eq "my user id"
  end

  describe "validate" do
    it "defaults to strict" do
      scope = described_class.all.validate

      expect(scope.params[:validation]).to eq "strict"
    end

    it "allows lenient" do
      scope = described_class.all.validate(Yext::Api::Enumerations::Validation::LENIENT)

      expect(scope.params[:validation]).to eq "lenient"
    end

    it "allows true" do
      scope = described_class.all.validate(true)

      expect(scope.params[:validation]).to eq "strict"
    end

    it "allows false" do
      scope = described_class.all.validate(false)

      expect(scope.params[:validation]).to eq "lenient"
    end

    it "allows nil" do
      scope = described_class.all.validate(nil)

      expect(scope.params[:validation]).to eq "lenient"
    end
  end
end
