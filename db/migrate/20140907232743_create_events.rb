class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.datetime :date
      t.string :agenda_url
      t.string :archive_status
      t.references :committee, index: true
      t.string :event_type

      t.timestamps
    end
  end
end
