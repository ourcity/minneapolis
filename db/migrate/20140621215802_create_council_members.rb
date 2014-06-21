class CreateCouncilMembers < ActiveRecord::Migration
  def change
    create_table :council_members do |t|
      t.string :ward
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
