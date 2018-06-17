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

RSpec.describe ApplicationCable::Connection, type: :channel do
  it "successfully connects" do
    connect "/cable"
  expect(connection.nil?).to be_falsy
  end
end
