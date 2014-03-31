Rails.application.routes.draw do

  mount TalkBot::Engine => "/talk_bot"
end
