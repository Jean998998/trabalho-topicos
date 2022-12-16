Rails.application.routes.draw do
  # devise_for :users2

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  root 'welcome#index'
  resources :mining_types
  resources :welcome
  resources :coins
  resources :users, only: [:new, :create, :show, :edit, :update]
end
