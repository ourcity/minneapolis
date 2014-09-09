require 'rails_helper'

RSpec.describe "event_attendees/show", :type => :view do
  before(:each) do
    @event_attendee = assign(:event_attendee, EventAttendee.create!(
      :voting_setting => "Voting Setting",
      :meeting_status => "Meeting Status",
      :order_of_appearance => "Order Of Appearance",
      :council_member => nil,
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Voting Setting/)
    expect(rendered).to match(/Meeting Status/)
    expect(rendered).to match(/Order Of Appearance/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
