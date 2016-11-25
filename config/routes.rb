Rails.application.routes.draw do
  resources :users, only: [:index, :update] do
    member do
      put :reset_token
    end
  end

  post '/authenticate', to: 'users#authenticate_with_sid'
end
