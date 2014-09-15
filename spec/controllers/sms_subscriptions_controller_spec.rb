require 'rails_helper'

RSpec.describe SmsSubscriptionsController, :type => :controller do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:issue2) { FactoryGirl.create(:issue) }

  context 'subscribing to two issues' do
    before do
      post :create, {
          'From' => '+16125551234',
          "Body" => "#{issue.code.downcase} #{issue2.code}"
        }
    end
    it 'should work' do
      expect(response.body).to eq "You are now subscribed to 2 OurCity items. Thanks!"
    end
  end

  context 'unsubscribing' do
    it 'should work' do
      post :create, {
          'From' => '+16125551234',
          "Body" => "uNsuBscribe #{issue.code}"
        }
      expect(response.body).to eq "You will no longer receive updates from OurCity."
      expect(SmsUser.where(phone: '16125551234').first).to be_nil
    end
  end

  context 'gibberish' do
    it 'should work' do
      post :create, {
          'From' => '16125551234',
          "Body" => "sadjfgasdjhfgaksd lsadflasdf"
        }
      expect(response.status).to eq(200)
      expect(response.body).to eq "Find subscription items at #{root_url}. 'STOP' to stop all updates."
    end
  end

end
