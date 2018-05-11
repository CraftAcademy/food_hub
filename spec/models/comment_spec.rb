require 'rails_helper'

RSpec.describe Comment, type: :model do
  it {is_expected.to have_db_column :body}
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :recipe}

  it 'has a valid factory' do
    expect(FactoryBot.create(:comment)).to be_valid
  end
end