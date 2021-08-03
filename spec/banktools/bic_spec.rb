# frozen_string_literal: true

RSpec.describe BankTools::Global::BIC do
  describe "#valid? and #errors" do
    it "is valid with valid BICs" do
      %w[
        ESSESESS
        DABASESX
        UNCRIT2B912
        DSBACNBXSHA
      ].each do |code|
        expect(described_class.new(code).valid?).to be true
      end
    end

    it "is invalid with BICs having the wrong format" do
      %w[
        ESS%SS
        ES
      ].each do |code|
         bic = described_class.new(code)
         expect(bic.valid?).to be false
         expect(bic.errors).to eq [ :bad_format ]
       end
    end

    # Regression.
    it "is invalid with a valid BIC as a substring of a longer string" do
      bic = described_class.new("before ESSESESS after")
      expect(bic.valid?).to be false
      expect(bic.errors).to eq [ :bad_format ]
    end

    it "is invalid with BICs having an unknown country code" do
      bic = described_class.new("ESSEXXSS")
      expect(bic.valid?).to be false
      expect(bic.errors).to eq [ :unknown_country ]
    end
  end

  describe "#normalize" do
    it "upcases and strips whitespace" do
      expect(described_class.new("es SESESs").normalize).to eq "ESSESESS"
    end
  end
end
