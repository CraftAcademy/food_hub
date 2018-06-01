require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {create(:user, email: 'whatever@random.com')}
  let(:recipe) {create(:recipe, title: 'Pizza', user: user)}
  it {is_expected.to have_db_column :body}
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :recipe}

  it 'has a valid factory' do
    expect(create(:comment, user: user)).to be_valid
  end

  describe 'Broadcast notification' do
    it 'on create' do 
      expect{ create(:comment, user: user, recipe: recipe)}
      .to have_broadcasted_to('notifications')
      .from_channel(WebNotificationsChannel)
      .with({message: '<p>whatever@random.com left a comment on Pizza.</p>'})
    end 
  end
end