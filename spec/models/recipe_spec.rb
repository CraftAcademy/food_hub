require 'rails_helper'

RSpec.describe Recipe, type: :model do
  recipe = FactoryBot.create(:recipe)

  describe 'Database table' do
    it {is_expected.to have_db_column :title}
    it {is_expected.to have_db_column :description}
    it {is_expected.to have_db_column :ingredients}
    it {is_expected.to have_db_column :directions}
  end

  describe 'Factory' do
    it 'can create a valid instance' do
      expect(recipe).to be_valid
    end
  end

  describe "Validations" do
    it "is not valid without a title" do
      recipe.title = nil
      expect(recipe).to_not be_valid
    end
    it "is not valid without a description" do
      recipe.description = nil
      expect(recipe).to_not be_valid
    end
    it "is not valid without a ingredients" do
      recipe.ingredients = nil
      expect(recipe).to_not be_valid
    end
    it "is not valid without a directions" do
      recipe.directions = nil
      expect(recipe).to_not be_valid
    end
  end
end
