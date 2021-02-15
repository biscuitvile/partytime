Rails.application.routes.draw do
  root "party#show"

  resource :session, only: [:create, :destroy]
  resources :tables, only: [:create, :show]
end
