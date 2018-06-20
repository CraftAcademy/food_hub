Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :omniauth_callbacks}
  root controller: :recipes, action: :index
  resources :recipes, except: [:destroy] do
    collection do
      post :search
    end
    resources :comments
  end
  resources :forks, only: [:create]
  resources :collections, only: [:index, :create, :destroy]
  resources :profiles, only: [:index]
  mount ActionCable.server => '/cable'
end
