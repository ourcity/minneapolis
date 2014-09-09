require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :description => "Description",
        :agenda_url => "Agenda Url",
        :archive_status => "Archive Status",
        :committee => nil,
        :event_type => "Event Type"
      ),
      Event.create!(
        :description => "Description",
        :agenda_url => "Agenda Url",
        :archive_status => "Archive Status",
        :committee => nil,
        :event_type => "Event Type"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Agenda Url".to_s, :count => 2
    assert_select "tr>td", :text => "Archive Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Event Type".to_s, :count => 2
  end
end
