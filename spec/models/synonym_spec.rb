require 'rails_helper'

RSpec.describe Synonym, type: :model do
  let(:word) { create(:word) }
  let(:synonym) { create(:synonym, word: word) }
  
  describe 'enums' do
    it { should define_enum_for(:authorization_status).with_values(pending: 0, authorized: 1) }
  end

  describe 'scopes' do
    it 'returns only authorized synonyms' do
      authorized_synonym = create(:synonym, word: word, authorization_status: :authorized)
      unauthorized_synonym = create(:synonym, word: word, authorization_status: :pending)

      expect(Synonym.authorized).to include(authorized_synonym)
      expect(Synonym.authorized).not_to include(unauthorized_synonym)
    end
  end

  describe '#authorize' do
    it 'updates authorization_status to authorized' do
      expect(synonym.authorization_status).to eq('pending')

      synonym.authorize
      synonym.reload

      expect(synonym.authorization_status).to eq('authorized')
    end
  end
end
