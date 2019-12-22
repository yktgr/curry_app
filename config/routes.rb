Rails.application.routes.draw do
devise_for :users
devise_scope :user do
    root :to => "devise/sessions#new"
end

resources :users
resources :recipes do
  resources :comments, only: [:create, :destroy]
end
resources :shops
resources :recipe_likes, only: [:create, :destroy]
end
