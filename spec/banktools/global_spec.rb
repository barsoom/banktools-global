# frozen_string_literal: true

RSpec.describe BankTools::Global do
  it "has a version number" do
    expect(BankTools::Global::VERSION).not_to be nil
  end
end
