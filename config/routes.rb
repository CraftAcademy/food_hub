Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  root controller: :recipes, action: :index
end
