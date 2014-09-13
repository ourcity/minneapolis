class CreateSmsUsers < ActiveRecord::Migration
  def change
    create_table :sms_users do |t|
      t.string :phone, limit: 25
      t.timestamps
    end

    change_table :subscriptions do |t|
      t.integer :sms_user_id
    end
  end
end
