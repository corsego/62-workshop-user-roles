Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  root "dashboard#index"
  get 'dashboard/index'
end
