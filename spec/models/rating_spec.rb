require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :value }
    it { is_expected.to have_db_column :recipe_id}
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_presence_of :recipe }
    it { is_expected.to validate_presence_of :user }
  end

  describe 'Associations' do 
    it { is_expected.to belong_to :recipe }
    it { is_expected.to belong_to :user }
  end 

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(create(:recipe)).to be_valid
    end
  end
end
