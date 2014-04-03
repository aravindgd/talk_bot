TalkBot::Engine.routes.draw do
 resources :meetings
 get "call" => "meetings#call"	
 match "voice" => "meetings#voice", via: [:get, :post]
 match "page_for_call" => "meetings#page_for_call", via: [:get, :post]
 match "make_call" => "meetings#make_call", via: [:get, :post]
end
