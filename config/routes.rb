Rails.application.routes.draw do
  devise_for :users
root to: 'recipes#index'
# devise_for :users
# devise_for :users, :controllers => {
#    :registrations => 'users/registrations',
#    :sessions => 'users/sessions'
#  }
#
#  devise_scope :user do
#    get "sign_in", :to => "users/sessions#new"
#    get "sign_out", :to => "users/sessions#destroy"
#  end

resources :users
resources :recipes do
  resources :comments
end
resources :recipe_likes, only: [:create, :destroy]
end
