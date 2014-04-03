TalkBot::Engine.routes.draw do
 resources :meetings
 get "call" => "meetings#call"	
 match "voice" => "meetings#voice", via: [:get, :post]
 
end
