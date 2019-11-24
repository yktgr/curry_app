Rails.application.routes.draw do
root to: 'recipes#index'
devise_for :users
resources :recipes do
  resources :comments
end
resources :users
resources :recipe_likes, only: [:create, :destroy]
end
