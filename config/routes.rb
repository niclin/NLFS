Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get "vip_lobby", to: "home#vip_lobby"

  root "home#index"
end
