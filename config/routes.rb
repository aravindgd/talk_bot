TalkBot::Engine.routes.draw do
  
 get "call" => "meetings#call"	
 get "voice" => "meetings#voice"
end
