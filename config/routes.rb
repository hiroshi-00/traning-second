Rails.application.routes.draw do
  
  get 'contact/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  root 'home#index'
  get 'contact/new', :to => "contact#new"
  post 'contact/create', :to => "contact#create"
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  resources :tweets do
    resource :searches,only: :index
    resource :favorites, only: [:create, :destroy]
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: :create
   get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

end