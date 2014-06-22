class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string  :title
      t.string  :name
      t.string  :description
      t.json    :store

      t.timestamps
    end
  end
end
