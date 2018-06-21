require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) {FactoryBot.create(:recipe)}

  describe 'Database table' do
    it { is_expected.to have_db_column :title}
    it { is_expected.to have_db_column :description}
    it { is_expected.to have_db_column :ingredients}
    it { is_expected.to have_db_column :directions}
    it { is_expected.to have_db_column :original_recipe_id}
    it { is_expected.to have_db_column :forked_recipes_ids}
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

  describe "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_and_belong_to_many :collections }
    it { is_expected.to have_many :comments }
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

  describe 'Attachment' do
    it 'is valid  ' do
      subject.image.attach(io: File.open(fixture_path + '/pizza.png'), filename: 'attachment.png', content_type: 'image/png')
      expect(subject.image).to be_attached
    end
  end
  
  describe '#rated_by?' do
    let(:rater) {create(:user, email: 'rater@random.com')}
    let(:non_rater) {create(:user, email: 'non_rater@random.com')}
    let!(:rating) {create(:rating, recipe: recipe, user: rater, value: "5")}

    it 'returns true if user has submitted a rating' do
      expect(recipe.rated_by?(rater)).to eq true
    end

    it 'returns false if user has NOY submitted a rating' do
      expect(recipe.rated_by?(non_rater)).to eq false
    end
  end

end
