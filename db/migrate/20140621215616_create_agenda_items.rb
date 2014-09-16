class CreateAgendaItems < ActiveRecord::Migration
  def change
    create_table :agenda_items do |t|
      t.string      :title
      t.references  :issue
      t.datetime    :acted_on
      t.string      :source # where the info came from
      t.string      :source_url # where the info came from
      t.json        :properties

      t.timestamps
    end
  end
end
