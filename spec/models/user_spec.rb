require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validates' do
    let!(:user) { create :user }

    context 'parameters cannot be empty' do
      it { expect(user).to be_valid }
    end

    context 'has a unique user email' do
      it { expect(user).to be_valid }
    end

    it 'has a unique user email' do
      user = build(:user, email: '')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
