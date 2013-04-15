HappyCamper::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login"  => "sessions#new",     :as => "login"
  get "signup" => "users#new",        :as => "signup"
  get "account" => "users#edit",      :as => "account"

  namespace :my do
    resources :trips
  end

  resources :users, except: [:index]
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "home#index"
end
