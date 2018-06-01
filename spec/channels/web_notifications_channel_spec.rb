require 'rails_helper'

RSpec.describe WebNotificationsChannel, type: :channel do

  before do 
    subscribe

  end

  it "subscribes to a stream" do
    expect(subscription).to be_confirmed
  end

  it 'stream #notifications is present' do 
    expect(streams).to include("notifications")
  end
end
