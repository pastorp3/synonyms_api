require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:word) { create(:word) }

  describe 'enums' do
    it { should define_enum_for(:authorization_status).with_values(pending: 0, authorized: 1) }
  end

  describe '#unauthorized?' do
    it 'returns true for pending authorization' do
      word.update(authorization_status: :pending)
      expect(word.unauthorized?).to be_truthy
    end

    it 'returns false for authorized authorization' do
      word.update(authorization_status: :authorized)
      expect(word.unauthorized?).to be_falsey
    end
  end

  describe '#authorize' do
    it 'updates authorization_status to authorized' do
      expect(word.authorization_status).to eq('pending')

      word.authorize
      word.reload

      expect(word.authorization_status).to eq('authorized')
    end
  end

  describe 'associations' do
    it { should have_many(:synonyms) }
  end
end
