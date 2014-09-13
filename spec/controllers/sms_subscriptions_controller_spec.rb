require 'rails_helper'

RSpec.describe SmsSubscriptionsController, :type => :controller do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:issue2) { FactoryGirl.create(:issue) }

  context 'subscribing to two issues' do
    before do
      post :create, {
          from:     '16125551234',
          sms_body: "suBscribe #{issue.code.downcase} #{issue2.code}"
        }
    end
    it 'should work' do
      expect(response.status).to eq(201)
      expect(response.body.blank?).to be true
      expect(assigns(:sms_user)).to_not be_nil
      expect(assigns(:sms_user).reload.subscriptions.map(&:subscribable)).to eq [issue, issue2]
    end


    context 'and then unsubscribing' do
      it 'should work' do
        post :create, {
            from:     '16125551234',
            sms_body: "uNsuBscribe #{issue.code}"
          }
        expect(response.status).to eq(201)
        expect(response.body.blank?).to be true
        expect(assigns(:sms_user)).to_not be_nil
        expect(assigns(:sms_user).reload.subscriptions.map(&:subscribable)).to eq [issue2]
      end
    end
  end


  context 'unsubscribing when not subscribed' do
    it 'should work' do
      post :create, {
          from:     '16125551234',
          sms_body: "uNsuBscribe #{issue.code}"
        }
      expect(response.status).to eq(202)
      expect(response.body.blank?).to be false
      expect(assigns(:sms_user)).to_not be_nil
      expect(assigns(:sms_user).reload.subscriptions.map(&:subscribable)).to eq []
    end
  end

end
