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
end
