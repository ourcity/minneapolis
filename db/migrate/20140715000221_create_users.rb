class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
