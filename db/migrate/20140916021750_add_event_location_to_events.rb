class AddEventLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_location, :string
    add_column :events, :time, :string
  end
end
