require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:sms_user) { FactoryGirl.create(:sms_user) }
  let(:subscription) { user.subscribe(issue) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:committee) { FactoryGirl.create(:committee) }
  let(:council_member) { FactoryGirl.create(:council_member) }

  context 'an email user' do
    context 'subscribing to something with notify: true' do
      it 'should send a message' do
        cnt = ActionMailer::Base.deliveries.length
        user.subscribe(issue, true)
        expect(ActionMailer::Base.deliveries.length).to eq cnt+1
      end
    end

    context 'subscribing to something with notify: false' do
      it 'should send a message' do
        cnt = ActionMailer::Base.deliveries.length
        user.subscribe(issue, false)
        expect(ActionMailer::Base.deliveries.length).to eq cnt
      end
    end
  end

  context 'an SMS user' do

    it 'should subscribe to an issue' do
      subscription = sms_user.subscribe(issue.code)
      expect(subscription.user).to be_nil
      expect(subscription).to be_valid
      #expect(subscription).to eq("You will receive OurCity updates from #{issue.display_name}. Text HELP for help or STOP to unsubscribe.")
    end

    it 'should subscribe to a committee' do
      subscription = sms_user.subscribe(committee.code)
      expect(subscription).to be_valid
      #expect(sms_user.subscribe(committee.code)).to eq("You will receive OurCity updates from #{committee.display_name}. Text HELP for help or STOP to unsubscribe.")
    end

    it 'should subscribe to a council_member' do
      subscription = sms_user.subscribe(council_member.code)
      expect(subscription).to be_valid
      #expect(sms_user.subscribe(council_member.code)).to eq("You will receive OurCity updates from #{council_member.display_name}. Text HELP for help or STOP to unsubscribe.")
    end

    it 'should not create an invalid subscription' do
      subscription =sms_user.subscribe('INVALID')
      expect(subscription).to_not be_valid
      #expect(sms_user.subscribe("INVALID")).to eq("Please visit us at #{Rails.application.routes.root_url} for more information. Text STOP and we won't bug you again.")
    end


  end


end
