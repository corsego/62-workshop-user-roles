Rails.application.routes.draw do
  resources :posts
  resources :users
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
