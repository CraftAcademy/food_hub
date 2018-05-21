require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {create(:user, email: 'whatever@random.com')}
  it {is_expected.to have_db_column :body}
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :recipe}

  it 'has a valid factory' do
    expect(create(:comment, user: user)).to be_valid
  end
end