require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'associations' do
    context 'belongs to merchant' do
      it { should belong_to(:merchant) }
    end

    context 'has many sales' do
      it { should have_many(:sales) }
    end
  end

  context 'when item is created' do
    context 'is valid' do
      let(:item) { create :item }

      it 'create the item correctly' do
        expect(item).to be_valid
      end
    end

    context 'is invalid' do
      let(:item) { create :item, price: '' }

      it 'error occurs when creating item' do
        expect { item }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
