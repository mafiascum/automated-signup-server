Rails.application.routes.draw do
  resources :users, only: [:index, :update] do
    member do
      put :reset_token
    end
  end
end
