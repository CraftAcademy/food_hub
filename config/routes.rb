Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :omniauth_callbacks}
  root controller: :recipes, action: :index
  resources :recipes, except: [:destroy] do
    collection do
      post :search
    end
    resources :comments
    resources :ratings, only: [:create]
  end

  mount ActionCable.server => '/cable'
end
