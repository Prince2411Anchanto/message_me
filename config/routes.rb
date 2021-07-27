Rails.application.routes.draw do
  root 'chatrooms#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
