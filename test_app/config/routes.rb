Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  get 'homes/about', as: :about
  get 'relationships/followings'
  get 'relationships/followers'
  get 'search' => 'searches#search'
  
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :spots, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :spot_comments, only: [:create, :destroy]
  end
  
end 