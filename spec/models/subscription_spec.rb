require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:subscription) { user.subscribe(issue) }
  let(:issue) { FactoryGirl.create(:issue) }

  context 'subscribing to something with notify: true' do
    it 'should send a message' do
      cnt = ActionMailer::Base.deliveries.length
      user.subscribe(issue, true)
      expect(ActionMailer::Base.deliveries.length).to eq cnt+1
    end
  end

  context 'subscribing to something with notify: true' do
    it 'should send a message' do
      cnt = ActionMailer::Base.deliveries.length
      user.subscribe(issue, false)
      expect(ActionMailer::Base.deliveries.length).to eq cnt
    end
  end
end
