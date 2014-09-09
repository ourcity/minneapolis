class EventAttendee < ActiveRecord::Base
  belongs_to :council_member
  belongs_to :event
end
