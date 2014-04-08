class CreateTalkBotSessions < ActiveRecord::Migration
  def change
    create_table :talk_bot_sessions do |t|
      t.integer :caller_number
      t.integer :caller_id
      t.integer :reciever_number
      t.integer :reciever_id
      t.integer :order_id
      t.integer :duration

      t.timestamps
    end
  end
end
