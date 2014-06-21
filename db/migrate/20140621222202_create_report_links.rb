class CreateReportLinks < ActiveRecord::Migration
  def change
    create_table :report_links do |t|
      t.string :title
      t.string :url
      t.references :agenda_item
      t.timestamps
    end
  end
end
