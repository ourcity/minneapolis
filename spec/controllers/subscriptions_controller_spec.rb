require 'rails_helper'

RSpec.describe SubscriptionsController, :type => :controller do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:committee) { FactoryGirl.create(:committee) }

  context 'a POST to :create' do
    it 'should create a subscription' do
      post :create, email: 'ben@thesubstars.com', issue_id: issue.id, format: 'html'
      expect(response.response_code).to eq(200)
      expect(assigns(:user).email).to eq('ben@thesubstars.com')
      expect(assigns(:user).subscriptions.count).to be 1
    end
  end

end
