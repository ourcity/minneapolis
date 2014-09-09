require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :description => "Description",
      :agenda_url => "Agenda Url",
      :archive_status => "Archive Status",
      :committee => nil,
      :event_type => "Event Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Agenda Url/)
    expect(rendered).to match(/Archive Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Event Type/)
  end
end
