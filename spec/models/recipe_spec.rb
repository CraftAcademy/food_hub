require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Database table' do
    it {is_expected.to have_db_column :title}
    it {is_expected.to have_db_column :description}
    it {is_expected.to have_db_column :ingredients}
    it {is_expected.to have_db_column :directions}
  end

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(FactoryBot.create(:recipe)).to be_valid
    end
  end
end
