# frozen_string_literal: true

RSpec.describe BankTools::Global::IBAN do
  describe "#valid? and #errors" do
    it "is valid with valid IBANs" do
      [
        "GB82WEST12345698765432",
        "GB82 WEST 12345698765432",
      ].each do |code|
        expect(described_class.new(code).errors).to eq []
        expect(described_class.new(code).valid?).to be true
      end
    end
  end

  it "is invalid with an unknown country code" do
    iban = described_class.new("XX82WEST12345698765432")
    expect(iban.valid?).to be false
    expect(iban.errors).to eq [ :unknown_country ]
  end

  it "is invalid with the wrong length for the country" do
    iban = described_class.new("GB82WES12345698765432")
    expect(iban.valid?).to be false
    expect(iban.errors).to eq [ :wrong_length ]
  end

  it "is invalid with the wrong format for the country" do
    iban = described_class.new("GB82WES712345698765432")
    expect(iban.valid?).to be false
    expect(iban.errors).to eq [ :bad_format ]
  end

  it "is invalid with a bad checksum" do
    iban = described_class.new("GB82WEST12345698765433")
    expect(iban.valid?).to be false
    expect(iban.errors).to eq [ :bad_checksum ]
  end

  describe "#normalize" do
    it "normalizes" do
      expect(described_class.new("RO49AAAA1B31007593840000").normalize).to eq "RO49 AAAA 1B31 0075 9384 0000"
    end
  end
end
