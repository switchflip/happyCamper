HappyCamper::Application.routes.draw do
  get "home/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login"  => "sessions#new",     :as => "login"
  get "signup" => "users#new",        :as => "signup"
  get "account" => "users#edit",      :as => "account"

  resources :users
  resources :sessions
  root :to => "home#index"
end
