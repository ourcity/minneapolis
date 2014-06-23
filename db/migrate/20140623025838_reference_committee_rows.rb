class ReferenceCommitteeRows < ActiveRecord::Migration
  def change
    change_table :agenda_items do |t|
      t.remove :source
    end

  end
end
