Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :omniauth_callbacks}
  resources :recipes, except: [:destroy]
  root controller: :recipes, action: :index
  resources :recipes do
    resources :comments
  end
  get :fork, controller: :recipes, action: :fork
  mount ActionCable.server => '/cable'
end
