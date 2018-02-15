# frozen_string_literal: true

RSpec.shared_examples("constants are Error Codes") do
  described_class.all.each_with_index do |constant, index|
    # codes 16 and 7514 are duplicated.
    unless [16, 7514].include? constant[:code]
      it "has unique code vale for #{index}" do
        expect(Yext::Api::Enumerations::ErrorCodes.all.count { |check_constant| check_constant[:code] == constant[:code] }).to eq 1
      end
    end

    it "has a code for value #{index}" do
      expect(constant[:code]).to be_positive
    end

    it "has an http_code for value #{index}" do
      expect(constant[:http_code]).to be_positive
    end

    it "has a message for value #{index}" do
      expect(constant[:message]).to be_present
    end
  end
end
