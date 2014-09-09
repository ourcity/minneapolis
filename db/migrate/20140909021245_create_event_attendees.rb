class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.string :voting_setting
      t.string :meeting_status
      t.string :order_of_appearance
      t.references :council_member, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
