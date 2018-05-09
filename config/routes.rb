Rails.application.routes.draw do
  get 'recipes/index'
  root controller: :recipes, action: :index
end
