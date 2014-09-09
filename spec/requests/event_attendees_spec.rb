require 'rails_helper'

RSpec.describe "EventAttendees", :type => :request do
  describe "GET /event_attendees" do
    it "works! (now write some real specs)" do
      get event_attendees_path
      expect(response.status).to be(200)
    end
  end
end
