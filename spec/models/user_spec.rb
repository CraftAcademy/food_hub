require 'rails_helper'

RSpec.describe User, type: :model do

  user = FactoryBot.create(:user)
  describe 'Database table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(user).to be_valid
    end
  end

  describe "Validations" do
    it "is not valid without a email" do
      user.email = nil
      expect(user).to_not be_valid
    end
    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
