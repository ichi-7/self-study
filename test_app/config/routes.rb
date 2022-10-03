Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  resources :users, only: [:show, :edit, :update]
  resources :spots, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :spot_comments, only: [:create, :destroy]
  end
  get 'homes/about', as: :about
  
end 