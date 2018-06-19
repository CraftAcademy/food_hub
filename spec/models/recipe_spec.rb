require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) {FactoryBot.create(:recipe)}

  describe 'Database table' do
    it { is_expected.to have_db_column :title}
    it { is_expected.to have_db_column :description}
    it { is_expected.to have_db_column :ingredients}
    it { is_expected.to have_db_column :directions}
    it { is_expected.to have_db_column :user_id}
    it { is_expected.to belong_to :user}
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :ingredients }
    it { is_expected.to validate_presence_of :directions }
  end

  describe 'Associations' do 
    it { is_expected.to have_many :ratings }
    it { is_expected.to belong_to :user }
  end 

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(recipe).to be_valid
    end
  end

  describe 'Broadcast notification' do
    it 'on create' do
      expect{ create(:recipe)}
      .to have_broadcasted_to('notifications')
      .from_channel(WebNotificationsChannel)
      .with({message: '<p>MyRecipe was created!</p>'})
    end
  end
end
