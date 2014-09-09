require 'rails_helper'

RSpec.describe AgendaItem, :type => :model do
  context 'agenda items tied to a bunch of stuff' do
    let(:user) { FactoryGirl.create(:user) }

    let(:issue) { FactoryGirl.create(:issue) }
    let(:committee) { FactoryGirl.create(:committee) }
    let(:council_member) { FactoryGirl.create(:council_member) }
    let(:agenda_item) { FactoryGirl.create(:agenda_item,
                                           council_member: council_member,
                                           committee:      committee,
                                           issue:          issue) }
    let(:some_other_agenda_item) { FactoryGirl.create(:agenda_item,
                                                      council_member: FactoryGirl.create(:council_member),
                                                      committee: FactoryGirl.create(:committee),
                                                      issue: issue) }

    let(:some_other_issue_agenda_item) { FactoryGirl.create(:agenda_item,
                                                            council_member: council_member,
                                                            committee:      committee,
                                                            issue: FactoryGirl.create(:issue)) }

    context 'a user interested in an issue' do
      before do
        user.subscribe(issue)
      end
      it 'should get the right agenda items' do
        expect(AgendaItem.for_user(user).all).to match_array [agenda_item, some_other_agenda_item]
      end
    end

    context 'a user interested in a council member' do
      before do
        user.subscribe(council_member)
      end
      it 'should get the right agenda items' do
        expect(AgendaItem.for_user(user).all).to match_array [agenda_item]
      end
    end

    context 'a user interested in a committee' do
      before do
        user.subscribe(committee)
      end
      it 'should get the right agenda items' do
        expect(AgendaItem.for_user(user).all).to match_array [agenda_item, some_other_issue_agenda_item]
      end
    end
  end
end


