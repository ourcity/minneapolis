class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references  :conversable, polymorphic: true

      t.string      :topic
      t.string      :conversation_id
      t.json        :properties

      t.timestamps
    end
  end
end
