class CreateProcessSteps < ActiveRecord::Migration
  def change
    create_table :process_steps do |t|
      t.string :short_name
      t.text :description
      t.integer :sort_order

      t.timestamps
    end
  end
end
