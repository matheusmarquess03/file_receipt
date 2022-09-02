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
end
