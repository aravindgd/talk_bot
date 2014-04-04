class AddMobileNumberToChatRoom < ActiveRecord::Migration
  def change
    add_column :chat_rooms, :mobile_number, :integer
  end
end
