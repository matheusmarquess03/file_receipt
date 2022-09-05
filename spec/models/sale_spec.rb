require 'rails_helper'

RSpec.describe Sale, type: :model do
  context 'associations' do
    context 'belongs to item' do
      it { should belong_to(:item) }
    end

    context 'belongs to purchaser' do
      it { should belong_to(:purchaser) }
    end
  end

  context 'when sale is created' do
    context 'is valid' do
      let(:sale) { create :sale }

      it 'create the item correctly' do
        expect(sale).to be_valid
      end
    end

    context 'is invalid' do
      let(:sale) { create :sale, quantity: '' }

      it 'error occurs when creating sales' do
        expect { sale }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
