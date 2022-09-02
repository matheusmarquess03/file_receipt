require 'rails_helper'

RSpec.describe Sales::CalculateTotalService do
  subject { described_class.call }

  context "when there are no registered sales" do
    it "returns zero" do
      is_expected.to be_zero
    end
  end

  context "when there are registered sales" do
    let(:sales) { create_list(:sale, 5) }

    before { sales }

    it "description" do
      is_expected.to be > 0
    end
  end
end