Rails.application.routes.draw do
  # ユーザのためのroute
  root "plans#index"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  
  resources :plans do
    get "search", on: :collection
    resource :cart, only: [:edit, :new]
  end

  resource :cart
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :new, :create]
  resource :password, only: [:show, :edit, :update]

  # 管理者
  namespace :admin do
    root "top#index"
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
    root "top#index"
    resources :orders do
      get "search", on: :collection
    end
  end

  # 管理者もオペレータもまだパスワード入力のためのrouteが存在していない

end
