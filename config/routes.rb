Rails.application.routes.draw do
  # ユーザのためのroute
  root "plans#index"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resources :plans, only: [:index, :show] do
    get "search", on: :collection
    resource :cart, only: [:edit, :new]
  end

  resource :cart 
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :new, :create]
  resource :password, only: [:show, :edit, :update]

  # 管理者
  namespace :admin do
    #root to: "tops#login"
    #get "admin" ==> "session#create"
    #get "login", to: "sessions#new", ad: :login
    #post "login", to: "sessiosn#create"
    #delete "logout", to: "sessions#destroy", as: :logout

    resources :members
    resources :plans do
      get "search", on: :collection
    end
    resources :parts do
      get "search", on: :collection
    end
  end

  # オペレーター
  namespace :operator do
    #root to: "tops#login"
    #get "operator" ==> "session#create"
    #get "login", to: "sessions#new", ad: :login
    #post "login", to: "sessiosn#create"
    #delete "logout", to: "sessions#destroy", as: :logout

    resources :orders do
      get "search", on: :collection
    end
  end
end
