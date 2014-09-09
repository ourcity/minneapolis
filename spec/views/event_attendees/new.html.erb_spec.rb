require 'rails_helper'

RSpec.describe "event_attendees/new", :type => :view do
  before(:each) do
    assign(:event_attendee, EventAttendee.new(
      :voting_setting => "MyString",
      :meeting_status => "MyString",
      :order_of_appearance => "MyString",
      :council_member => nil,
      :event => nil
    ))
  end

  it "renders new event_attendee form" do
    render

    assert_select "form[action=?][method=?]", event_attendees_path, "post" do

      assert_select "input#event_attendee_voting_setting[name=?]", "event_attendee[voting_setting]"

      assert_select "input#event_attendee_meeting_status[name=?]", "event_attendee[meeting_status]"

      assert_select "input#event_attendee_order_of_appearance[name=?]", "event_attendee[order_of_appearance]"

      assert_select "input#event_attendee_council_member_id[name=?]", "event_attendee[council_member_id]"

      assert_select "input#event_attendee_event_id[name=?]", "event_attendee[event_id]"
    end
  end
end
