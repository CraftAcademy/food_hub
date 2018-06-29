require 'rails_helper'
require './features/support/omniauth'


RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'Database table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :full_name }
  end

  describe "Associations" do
    it { is_expected.to have_one :collection }
    it { is_expected.to have_many :recipes }
    it { is_expected.to have_many :comments }
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


  describe 'User roles' do
    let(:admin) {create :user, email: 'admin@random.com', role: :admin}
    let(:user_1) {create :user, email: 'user_1@random.com', role: :user}

    it '#admin? responds true if user role is admin' do
      expect(admin.admin?).to eq true
    end

    it '#admin? responds false if user role is NOT admin' do
      expect(user_1.admin?).to eq false
    end

    it '#user? responds true if user role is user' do
      expect(user_1.user?).to eq true
    end

    it '#user? responds false if user role is NOT user' do
      expect(admin.user?).to eq false
    end
  end
end
