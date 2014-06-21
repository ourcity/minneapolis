class CreateCommitteeMembers < ActiveRecord::Migration
  def change
    create_table :committee_members do |t|
      t.references :committee, index: true
      t.references :council_member, index: true
      t.boolean :chair
      t.boolean :vice_chair

      t.timestamps
    end
  end
end
