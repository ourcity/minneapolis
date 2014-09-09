require 'rails_helper'

RSpec.describe "events/edit", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :description => "MyString",
      :agenda_url => "MyString",
      :archive_status => "MyString",
      :committee => nil,
      :event_type => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_description[name=?]", "event[description]"

      assert_select "input#event_agenda_url[name=?]", "event[agenda_url]"

      assert_select "input#event_archive_status[name=?]", "event[archive_status]"

      assert_select "input#event_committee_id[name=?]", "event[committee_id]"

      assert_select "input#event_event_type[name=?]", "event[event_type]"
    end
  end
end
