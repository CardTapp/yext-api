# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Configuration do
  let(:configuration) { Yext::Api.configuration }

  around(:each) do |example_proxy|
    configuration = Yext::Api.configuration

    orig_account_id                 = configuration.account_id
    orig_api_key                    = configuration.api_key
    orig_api_version                = configuration.api_version
    orig_yext_username              = configuration.yext_username
    orig_yext_user_id               = configuration.yext_user_id
    orig_sandbox                    = configuration.sandbox
    orig_validation_level           = configuration.validation_level
    orig_default_callback_processor = configuration.default_callback_processor

    begin
      example_proxy.run
    ensure
      configuration.account_id                 = orig_account_id
      configuration.api_key                    = orig_api_key
      configuration.api_version                = orig_api_version
      configuration.yext_username              = orig_yext_username
      configuration.yext_user_id               = orig_yext_user_id
      configuration.sandbox                    = orig_sandbox
      configuration.validation_level           = orig_validation_level
      configuration.default_callback_processor = orig_default_callback_processor
    end
  end

  it "is a Singleton class" do
    expect(Yext::Api::Utils::Configuration.included_modules).to be_include(Singleton)
  end

  describe "validation_level" do
    Yext::Api::Enumerations::Validation.all.each do |validation_level|
      it "allows the value #{validation_level}" do
        expect { configuration.validation_level = validation_level }.not_to raise_error
      end
    end

    it "allows nil" do
      expect { configuration.validation_level = nil }.not_to raise_error
    end

    it "does not allow other strings" do
      expect { configuration.validation_level = "this is not a validation level" }.to raise_error ArgumentError
    end

    it "does not allow other data types" do
      expect { configuration.validation_level = false }.to raise_error ArgumentError
    end
  end

  it "allows the assignment of account_id" do
    configuration.account_id = "a fake value"
    expect(configuration.account_id).to eq "a fake value"
  end

  it "allows the assignment of api_key" do
    configuration.api_key = "a fake value"
    expect(configuration.api_key).to eq "a fake value"
  end

  it "allows the assignment of api_version" do
    configuration.api_version = "a fake value"
    expect(configuration.api_version).to eq "a fake value"
  end

  it "allows the assignment of yext_username" do
    configuration.yext_username = "a fake value"
    expect(configuration.yext_username).to eq "a fake value"
  end

  it "allows the assignment of yext_user_id" do
    configuration.yext_user_id = "a fake value"
    expect(configuration.yext_user_id).to eq "a fake value"
  end

  it "allows the assignment of sandbox" do
    configuration.sandbox = "a fake value"
    expect(configuration.sandbox).to eq "a fake value"
  end

  describe "callback_proccessors" do
    before(:each) do
      methods = Yext::Api.configuration.send(:callback_names)
      methods << :test_callback
      methods << :valid_test_callback

      allow(Yext::Api.configuration).to receive(:callback_names).and_return methods.dup
    end

    # A valid class
    class ValidCallbackProcessor
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def add_request_changed
        # do nothing
      end

      def test_callback
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end
    end

    # A valid class with unused parameters
    class ValidCallbackProcessorWithDefault
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end

      def add_request_changed(_unknown = {})
        # do nothing
      end

      def test_callback(_unknown = {})
        # do nothing
      end
    end

    # An invalid class where callbacks require parameters
    class InvalidCallbackProcessorMethodsKeyParams
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end

      def add_request_changed(_name:, _changes: {})
        # do nothing
      end

      def test_callback(_name:, _changes: {})
        # do nothing
      end
    end

    # An invalid class where callbacks require parameters
    class InvalidCallbackProcessorMethodsExtraParams
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end

      def add_request_changed(_name, _changes: {})
        # do nothing
      end

      def test_callback(_name, _changes: {})
        # do nothing
      end
    end

    # An invalid class where callbacks are private
    class InvalidCallbackProcessorPrivate
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end

      private

      def add_request_changed
        # do nothing
      end

      def test_callback
        # do nothing
      end
    end

    # An invalid class where callbacks are protected
    class InvalidCallbackProcessorProtected
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end

      protected

      def add_request_changed
        # do nothing
      end

      def test_callback
        # do nothing
      end
    end

    # An invalid class where callbacks are missing
    class InvalidCallbackProcessorMissing
      def initialize(_meta, _object, _language)
        # do nothing
      end

      def valid_test_callback
        # do nothing
      end
    end

    describe "default_callback_processor=" do
      it "verifies the existence of all methods" do
        expect(Rails).not_to receive(:logger)
        configuration.default_callback_processor = ValidCallbackProcessor
      end

      it "verifies the existence of all methods with a defaulted parameter" do
        expect(Rails).not_to receive(:logger)
        configuration.default_callback_processor = ValidCallbackProcessorWithDefault
      end

      it "warns if any method has too many key parameters" do
        expect(Rails).to receive(:logger).exactly(2).times.and_return instance_double(ActiveSupport::Logger, warn: nil)
        configuration.default_callback_processor = InvalidCallbackProcessorMethodsKeyParams
      end

      it "warns if any method has too many parameters" do
        expect(Rails).to receive(:logger).exactly(2).times.and_return instance_double(ActiveSupport::Logger, warn: nil)
        configuration.default_callback_processor = InvalidCallbackProcessorMethodsExtraParams
      end

      it "warns if any method is private" do
        expect(Rails).to receive(:logger).exactly(2).times.and_return instance_double(ActiveSupport::Logger, warn: nil)
        configuration.default_callback_processor = InvalidCallbackProcessorPrivate
      end

      it "warns if any method is protected" do
        expect(Rails).to receive(:logger).exactly(2).times.and_return instance_double(ActiveSupport::Logger, warn: nil)
        configuration.default_callback_processor = InvalidCallbackProcessorProtected
      end

      it "warns if any method is missing" do
        expect(Rails).to receive(:logger).exactly(2).times.and_return instance_double(ActiveSupport::Logger, warn: nil)
        configuration.default_callback_processor = InvalidCallbackProcessorMissing
      end
    end

    describe "set_callback_processor" do
      before(:each) do
        configuration.default_callback_processor = ValidCallbackProcessor
        configuration.set_callback_processor(:valid_test_callback, nil)
        configuration.set_callback_processor(:add_request_changed, nil)
      end

      it "does not allow an invalid callback name" do
        expect { configuration.set_callback_processor("fake name", ValidCallbackProcessor) }.
            to raise_error ArgumentError
      end

      it "allows a string name" do
        configuration.set_callback_processor "Valid_Test_Callback", ValidCallbackProcessorWithDefault

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessorWithDefault
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "allows unsetting a value" do
        configuration.set_callback_processor "Valid_Test_Callback", ValidCallbackProcessorWithDefault

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessorWithDefault
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor

        configuration.set_callback_processor "Valid_Test_Callback", nil

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "allows a symbol name" do
        configuration.set_callback_processor :valid_test_callback, ValidCallbackProcessorWithDefault

        expect(configuration.get_callback_processor("Valid_Test_Callback")).to eq ValidCallbackProcessorWithDefault
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "allows a processor without a defaulted parameter" do
        configuration.default_callback_processor = ValidCallbackProcessorWithDefault
        configuration.set_callback_processor "Valid_Test_Callback", ValidCallbackProcessor

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessorWithDefault
      end

      it "does not allow a processor with too many key parameters" do
        expect { configuration.set_callback_processor :add_request_changed, InvalidCallbackProcessorMethodsKeyParams }.
            to raise_error ArgumentError

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "does not allow a processor with too many parameters" do
        expect { configuration.set_callback_processor :add_request_changed, InvalidCallbackProcessorMethodsExtraParams }.
            to raise_error ArgumentError

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "does not allow a processor with a private function" do
        expect { configuration.set_callback_processor :add_request_changed, InvalidCallbackProcessorPrivate }.
            to raise_error ArgumentError

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "does not allow a processor with a protected function" do
        expect { configuration.set_callback_processor :add_request_changed, InvalidCallbackProcessorProtected }.
            to raise_error ArgumentError

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end

      it "does not allow a processor with a missing function" do
        expect { configuration.set_callback_processor :add_request_changed, InvalidCallbackProcessorMissing }.
            to raise_error ArgumentError

        expect(configuration.get_callback_processor(:valid_test_callback)).to eq ValidCallbackProcessor
        expect(configuration.get_callback_processor(:add_request_changed)).to eq ValidCallbackProcessor
      end
    end
  end
end
