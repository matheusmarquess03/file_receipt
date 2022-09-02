require 'rails_helper'

RSpec.describe Sales::ImportService do
  subject { described_class.call(file) }

  context "when the file was not sent" do
    let(:file) { "" }

    it "returns result with message: File invalid!" do
      expect(subject[:value]).to eq("File invalid!")
    end
  end

  context "when file has extension correct" do
    context "when file is empty" do
      let(:file) { fixture_file_upload('empty.tab') }

      it "returns success false" do
        expect(subject[:success]).to be_falsey
      end

      it "returns result with message: File is empty!" do
        expect(subject[:value]).to eq("File is empty!")
      end
    end

    context "when file is not empty" do
      context "when data is corret" do
        let(:file) { fixture_file_upload('example_input.tab') }

        it "returns success true" do
          expect(subject[:success]).to be_truthy
        end

        it "Total gross income is greater than 0" do
          expect(subject[:value]).to be > 0
        end
      end
    end
  end

  context "when file extension is not correct" do
    let(:file) { fixture_file_upload('download.png') }

    it "returns result with message: File invalid!" do
      expect(subject[:value]).to eq("File invalid!")
    end
  end
end