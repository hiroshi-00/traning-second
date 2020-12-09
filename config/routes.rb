Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root 'home#index'
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :tweets do
    resources :searches,only:[:index]
    resource :favorites, only: [:create, :destroy]
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
