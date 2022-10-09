Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  get 'homes/about', as: :about
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
  
  resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :group_users, only: [:create, :destroy]
  end
  
end 