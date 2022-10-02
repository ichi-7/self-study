Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  resources :users, only: [:show, :edit, :update]
  resources :spots, only: [:new, :create, :index, :show, :destroy]
  
  get 'homes/about', as: :about
  
end