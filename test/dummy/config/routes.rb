Rails.application.routes.draw do
    resources :chat_rooms
    root :to =>  "chat_rooms#index"
    mount TalkBot::Engine => "/talk_bot"
end
