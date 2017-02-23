Rails.application.routes.draw do
  resources :users, defaults: {format: 'json'}, only: [:index, :update] do
    member do
      put :reset_token
    end
  end
  post '/authenticate', to: 'users#authenticate_with_sid'

  resources :game_queues, defaults: {format: 'json'}
end
