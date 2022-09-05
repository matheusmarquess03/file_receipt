require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'associations' do
    context 'has many addresses' do
      it { should have_many(:addresses) }
    end

    context 'has many items' do
      it { should have_many(:items) }
    end

    context 'has many sales' do
      it { should have_many(:sales) }
    end
  end

  context 'when person is created' do
    context 'is valid' do
      let(:person) { create :person }

      it 'create the item correctly' do
        expect(person).to be_valid
      end
    end

    context 'is invalid' do
      let(:person) { create :person, name: '' }

      it 'error occurs when creating person' do
        expect { person }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
