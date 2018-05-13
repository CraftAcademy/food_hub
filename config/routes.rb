Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :edit]
  root controller: :recipes, action: :index
end
