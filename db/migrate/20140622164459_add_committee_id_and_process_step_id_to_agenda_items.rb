class AddCommitteeIdAndProcessStepIdToAgendaItems < ActiveRecord::Migration
  def change
    add_reference :agenda_items, :process_step, index: true
    add_reference :agenda_items, :committee, index: true
    add_reference :agenda_items, :council_member, index: true
    add_reference :agenda_items, :event, index: true
  end
end
