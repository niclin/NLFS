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

  get "vip_lobby", to: "home#vip_lobby"
  get "guide", to: "home#guide"
  post "enter_lobby", to: "home#enter_lobby"

  root "posts#index"
end
