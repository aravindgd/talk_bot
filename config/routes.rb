TalkBot::Engine.routes.draw do
 
  root :to => "sessions#index"
  resources :sessions

 resources :meetings
 get "call" => "meetings#call"	
 match "voice" => "meetings#voice", via: [:get, :post]
 
end
