require_dependency TalkBot::Engine.root.join('app', 'model', 'talk_bot', 'session').to_s
module TalkBot
  class Session < ActiveRecord::Base
  end
end
