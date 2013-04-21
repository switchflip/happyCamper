HappyCamper::Application.routes.draw do

  get "items/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login"  => "sessions#new",     :as => "login"
  get "signup" => "users#new",        :as => "signup"
  get "account" => "users#edit",      :as => "account"

  namespace :my do
    resources :trips do
      member do
        post "invite"
      end
    end
    resources :items
  end

  resources :users, except: [:index]
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "home#index"
end
