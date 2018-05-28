require 'rails_helper'
require './features/support/omniauth'


RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'Database table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(user).to be_valid
    end
  end

  describe 'OAuth methods' do 
    let(:auth_response) {OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_response)}
    it "creates an instance from an oauth hash" do
      create_user = lambda {User.from_omniauth(auth_response)
      }
      expect{create_user.call}.to change{User.count}.from(0).to(1)
    end
  end
end

