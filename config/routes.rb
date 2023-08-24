Rails.application.routes.draw do
  devise_for :users
  root "play#index"

  resources :plays, only: [:index]

  get '/correct_player', to: 'play#correct_player?'
end
