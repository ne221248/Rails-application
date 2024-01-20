Rails.application.routes.draw do
  # ユーザのためのroute
  root "plans#index"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resources :plans, only: [:index, :show] do
    get "search", on: :collection
    resource :cart, only: [:new]
  end

  resource :cart, only: [:show, :edit, :update, :create, :destroy]
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :new, :create, :destroy]
  resource :password, only: [:show, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :destroy]

  # 管理者、オペレータのログイン用
  get "/admin_login" => "top#admin_login"
  get "/operator_login" => "top#operator_login"

  # 管理者
  namespace :admin do
    root "top#index"
    resource :session, only: [:create, :destroy]

    resources :members
    resources :plans do
      get "search", on: :collection
    end
    resources :parts do
      get "search", on: :collection
    end
    resources :orders, only: [:index, :show, :destroy]
  end

  # オペレーター
  namespace :operator do
    root "top#index"
    resource :session, only: [:create, :destroy]
    resources :orders, only: [:index, :show, :edit, :update]
  end
end
