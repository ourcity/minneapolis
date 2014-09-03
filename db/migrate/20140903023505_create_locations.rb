class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to  :user
      t.string      :address
      t.float       :latitude,  null: false
      t.float       :longitude, null: false
      t.point       :lonlat,    geographic: true, spatial: true, index: true
      t.json        :data

      t.timestamps
    end
  end
end
