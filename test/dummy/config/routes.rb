Rails.application.routes.draw do

    resources :chat_rooms
   
  mount TalkBot::Engine => "/talk_bot"
end
