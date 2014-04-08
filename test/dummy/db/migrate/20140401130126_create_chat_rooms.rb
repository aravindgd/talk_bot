class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|
      t.text :order
      t.string :performer_name
      t.string :customer_name
      t.integer :duration
      t.text :call_type
      t.integer :mobile_number
      t.timestamps
    end
  end
end
