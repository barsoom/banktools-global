# frozen_string_literal: true

RSpec.describe BankTools::Global::BIC do
  it "is valid with valid codes" do
    %w[
    ESSESESS
    DABASESX
    UNCRIT2B912
    DSBACNBXSHA
    ].each do |code|
      expect(described_class.new(code).valid?).to be true
    end
  end

  it "is invalid with codes having the wrong format" do
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
  it "is invalid with a valid code as a substring of a longer string" do
    bic = described_class.new("before ESSESESS after")
    expect(bic.valid?).to be false
    expect(bic.errors).to eq [ :bad_format ]
  end

  it "is invalid with codes having an unknown country code" do
    bic = described_class.new("ESSEXXSS")
    expect(bic.valid?).to be false
    expect(bic.errors).to eq [ :unknown_country ]
  end
end
