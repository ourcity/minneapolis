class Event < ActiveRecord::Base
  belongs_to :committee
  has_many :event_attendees
  has_many :council_members, through: :event_attendees
  has_many :agenda_items

end
