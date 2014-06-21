class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.string :type
      t.string :info_url

      t.timestamps
    end
  end
end
