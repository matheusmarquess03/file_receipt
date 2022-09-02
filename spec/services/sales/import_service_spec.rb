require 'rails_helper'

RSpec.describe Sales::ImportService do
  subject { described_class.call(file) }

  context "when file has extension correct" do
    context "when file is empty" do
      let(:file) { fixture_file_upload('empty.tab') }

      it "Total gross income is zero" do
        expect(subject).to be_zero
      end
    end

    context "when file is not empty" do
      context "when data is corret" do
        let(:file) { fixture_file_upload('example_input.tab') }

        it "Total gross income is greater than 0" do
          expect(subject).to be > 0
        end
      end
    end
  end

  context "when file extension is not correct" do
    let(:file) { fixture_file_upload('download.png') }

    it "raise_error" do
      expect{ subject }.to raise_error(Sales::ImportService::ImportError)
    end
  end
end