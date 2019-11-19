Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/delete'
  get 'users/update'
  devise_for :users
root to: 'recipes#index'
resources :recipes
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
end
