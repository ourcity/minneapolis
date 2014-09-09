class AddFieldsToAgendaItems < ActiveRecord::Migration
  def change
    add_reference :agenda_items, :event, index: true
    add_column :agenda_items, :roll_call, :string
    add_column :agenda_items, :motion, :string
    add_column :agenda_items, :vote, :string
    add_column :agenda_items, :notes, :text
  end
end
