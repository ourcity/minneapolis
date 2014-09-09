require 'rails_helper'

RSpec.describe "event_attendees/index", :type => :view do
  before(:each) do
    assign(:event_attendees, [
      EventAttendee.create!(
        :voting_setting => "Voting Setting",
        :meeting_status => "Meeting Status",
        :order_of_appearance => "Order Of Appearance",
        :council_member => nil,
        :event => nil
      ),
      EventAttendee.create!(
        :voting_setting => "Voting Setting",
        :meeting_status => "Meeting Status",
        :order_of_appearance => "Order Of Appearance",
        :council_member => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of event_attendees" do
    render
    assert_select "tr>td", :text => "Voting Setting".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting Status".to_s, :count => 2
    assert_select "tr>td", :text => "Order Of Appearance".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
