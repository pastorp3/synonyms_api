require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin, username: 'admin_user', password: 'admin_password') }

  describe '#authenticate' do
    it 'authenticates with correct password' do
      expect(admin.authenticate('admin_password')).to be_truthy
    end

    it 'does not authenticate with incorrect password' do
      expect(admin.authenticate('wrong_password')).to be_falsey
    end
  end

  describe '#generate_token' do
    it 'generates a valid token' do
      token = admin.generate_token
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256').first

      expect(decoded_token['username']).to eq('admin_user')
    end
  end
end