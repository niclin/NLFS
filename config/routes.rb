Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" } do
  end

  resources :posts, only: [:index, :show]

  namespace :my do
    resource :post, only: [:new, :create, :edit, :update] do
      member do
        get :preview
        patch :submit
      end
    end
  end

  namespace :admin do
    resources :coupons do
      member do
        get :print
        patch :tag_sended
      end
      collection do
        post :batch_create
        get :bulk_print
      end
    end

    resources :users
    resources :posts do
      member do
        patch :approve
      end
    end

    root "dashboard#index"
  end

  get "vip_lobby", to: "home#vip_lobby"
  get "guide", to: "home#guide"
  post "enter_lobby", to: "home#enter_lobby"

  root "posts#index"
end
