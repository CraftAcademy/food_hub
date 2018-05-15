Rails.application.routes.draw do
  devise_for :users
  resources :recipes, except: [:destroy]
  root controller: :recipes, action: :index
end
