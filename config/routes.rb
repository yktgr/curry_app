Rails.application.routes.draw do
  get 'recipe_likes/create'
  get 'recipe_likes/destroy'
root to: 'recipes#index'
devise_for :users
resources :recipes
resources :users
resources :recipe_likes, only: [:create, :destroy]
end
