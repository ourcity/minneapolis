require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'a user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:issue) { FactoryGirl.create(:issue) }
    let(:committee) { FactoryGirl.create(:committee) }

    it 'should be able to subscribe to an issue only once' do
      user.subscribe(issue)
      expect(user.subscriptions.count).to be 1
      user.subscribe(committee)
      user.subscribe(committee)
      expect(user.subscriptions.count).to be 2
      expect(user.subscriptions.map(&:subscribable)).to eq([issue, committee])
    end
    it 'should not be able to other stuff' do
      user.subscribe(FactoryGirl.create(:user))
      expect(user.subscriptions.count).to be 0
    end
    it 'should get agenda items for digest subscriptions' do

    end
  end
end


