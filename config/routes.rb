Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show]
  root controller: :recipes, action: :index
end
