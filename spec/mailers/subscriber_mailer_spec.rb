require "rails_helper"

RSpec.describe SubscriberMailer, :type => :mailer do
  let(:user) { FactoryGirl.create(:user) }
  let(:subscription) { user.subscribe(issue) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:committee) { FactoryGirl.create(:committee) }
  let(:council_member) { FactoryGirl.create(:council_member) }
  let(:agenda_item) { FactoryGirl.create(:agenda_item,
                                         council_member: council_member,
                                         committee:      committee,
                                         issue:          issue) }
  # context 'quick_subscribe_welcome' do
  #   subject { SubscriberMailer.quick_subscribe_welcome(user, subscription) }
  #   it 'should make a message' do
  #     expect(subject.subject).to eq "[OurCity] Welcome to OurCity (action required)"
  #     expect(subject.to).to eq [user.email]
  #     expect(subject.from).to eql(['ourcitymn@gmail.com'])
  #     expect(subject.body.encoded).to match("You're almost set to receive updates from OurCity")
  #   end
  # end

  context 'quick_subscribe_confirm' do
    subject { SubscriberMailer.quick_subscribe_confirm(user) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] OurCity Account Confirmation"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['ourcitymn@gmail.com'])
      expect(subject.body.encoded).to match("You're receiving updates for the following items:")
    end
  end

  context 'quick_subscribe_confirm with one subscription' do
    subject { SubscriberMailer.quick_subscribe_confirm(user, user.subscribe(issue, false)) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] OurCity Account Confirmation"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['ourcitymn@gmail.com'])
      expect(subject.body.encoded).to match("You will now receive updates")
      expect(subject.body.encoded).to_not match("You're receiving updates for the following items:")
    end
  end

  context 'quick_subscribe_confirm with an existing subscription' do
    before { user.subscribe(committee, false) }
    subject { SubscriberMailer.quick_subscribe_confirm(user, user.subscribe(issue, false)) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] OurCity Account Confirmation"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['ourcitymn@gmail.com'])
      expect(subject.body.encoded).to match("You will now receive updates")
      expect(subject.body.encoded).to match("You're receiving updates for the following items:")
    end
  end

  context 'agenda_update' do
    subject { SubscriberMailer.agenda_update(issue, AgendaItem.all, user) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] New Agenda Item Posted"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['ourcitymn@gmail.com'])
    end
  end

  context 'agenda_digest' do
    subject { SubscriberMailer.agenda_digest(AgendaItem.all, user) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] Agenda Item Digest - #{Date.today.to_formatted_s}"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['ourcitymn@gmail.com'])
    end
  end
end
