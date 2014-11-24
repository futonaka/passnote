Rails.application.routes.draw do
  resources :entries

  resources :notes

  get "home", to: "home#index", as: "user_root"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  get 'home/show'

  root 'notes#index'
end
