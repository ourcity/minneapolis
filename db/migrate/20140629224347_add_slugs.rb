class AddSlugs < ActiveRecord::Migration
  def change
    change_table :council_members do |t|
      t.string :slug, limit: 100
    end
    CouncilMember.all.each(&:save)
    change_table :committees do |t|
      t.string :slug, limit: 150
    end
    Committee.all.each(&:save)
  end
end
