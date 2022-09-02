require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'associations' do
    context 'belongs to person' do
      it { should belong_to(:person) }
    end
  end
end
