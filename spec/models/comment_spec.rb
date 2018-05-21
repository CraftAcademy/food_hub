require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {craete(:user)}
  it {is_expected.to have_db_column :body}
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :recipe}

  it 'has a valid factory' do
    expect(FactoryBot.create(:comment, user: user)).to be_valid
  end
end