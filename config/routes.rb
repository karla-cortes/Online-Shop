Rails.application.routes.draw do
  resources :reviews
  resources :products

  root 'products#index'
end
