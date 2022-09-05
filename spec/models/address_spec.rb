require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'associations' do
    context 'belongs to person' do
      it { should belong_to(:person) }
    end
  end

  context 'when address is created' do
    context 'is valid' do
      let(:address) { create :address }

      it 'create the address correctly' do
        expect(address).to be_valid
      end
    end

    context 'is invalid' do
      let(:address) { create :address, street: '' }

      it 'error occurs when creating address' do
        expect { address }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
