Rails.application.routes.draw do
  resources :entries

  resources :user_has_notes

  resources :notes
  get "/notes/:note_id/entries" => "entries#list", as: "entry_list"

  get "home", to: "devise/sessions#new", as: "user_root"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  get 'home/show'

  root 'notes#index'
end
