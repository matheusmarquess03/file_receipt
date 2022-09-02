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
end
