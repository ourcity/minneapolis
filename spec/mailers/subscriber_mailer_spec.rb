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
  context 'quick_subscribe_welcome' do
    subject { SubscriberMailer.quick_subscribe_welcome(user, subscription) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] Welcome to OurCity (action required)"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['noreply@ourcity.com'])
      expect(subject.body.encoded).to match("You're almost set to receive updates from #{issue.display_name}")
    end
  end

  context 'quick_subscribe_confirm' do
    subject { SubscriberMailer.quick_subscribe_confirm(user, subscription) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] OurCity Account Confirmation"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['noreply@ourcity.com'])
      expect(subject.body.encoded).to match("You're receiving updates for the following things:")
    end
  end

  context 'agenda_update' do
    subject { SubscriberMailer.agenda_update(issue, agenda_item, user) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] New Agenda Item Posted"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['noreply@ourcity.com'])
    end
  end

  context 'agenda_digest' do
    subject { SubscriberMailer.agenda_digest(AgendaItem.all, user) }
    it 'should make a message' do
      expect(subject.subject).to eq "[OurCity] Agenda Item Digest - #{Date.today.to_formatted_s}"
      expect(subject.to).to eq [user.email]
      expect(subject.from).to eql(['noreply@ourcity.com'])
    end
  end
end
