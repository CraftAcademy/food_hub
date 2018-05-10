require 'rails_helper'

RSpec.describe User, type: :model do

  user = FactoryBot.create(:user)
  describe 'Database table' do
    it { is_expected.to have_db_column :email }
    it { should validate_presence_of(:email) }
    it { is_expected.to have_db_column :encrypted_password }
    it { should validate_presence_of(:password) }
  end

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(user).to be_valid
    end
  end
end
