module TalkBot
  class Session < ActiveRecord::Base
    belongs_to :caller, class_name: TalkBot.caller_class
    belongs_to :reciever, class_name: TalkBot.reciever_class
    belongs_to :order, class_name: TalkBot.order_class
  end
end
