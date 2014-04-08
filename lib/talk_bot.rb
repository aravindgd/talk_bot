require "talk_bot/engine"
require 'haml'
require 'twilio-ruby'
module TalkBot
  mattr_accessor :caller_class
  mattr_accessor :reciever_class
  mattr_accessor :order_class
end
