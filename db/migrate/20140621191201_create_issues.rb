class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :slug, limit: 100
      t.string :summary, limit: 1000
      t.timestamps
    end
  end
end
