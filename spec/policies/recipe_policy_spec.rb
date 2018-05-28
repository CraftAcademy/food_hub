require 'rails_helper'

RSpec.describe RecipePolicy do

  let(:user_1) { create(:user, email: 'user_1@random.com', role: :user) }
  let(:user_2) { create(:user, email: 'user_2@random.com', role: :user) }
  let(:admin) { create(:user, email: 'admin@random.com', role: :admin) }

  let(:recipe) { create(:recipe, user: user_1) }
  context 'user is a user and owner of the recipe' do
    subject { described_class.new(user_1, recipe) }
    it { is_expected.to permit_edit_and_update_actions }
  end

  context 'user is a user and NOT owner of the recipe' do
    subject { described_class.new(user_2, recipe) }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'user is an admin' do
    subject { described_class.new(user_1, recipe) }
    it { is_expected.to permit_edit_and_update_actions }
  end
end
