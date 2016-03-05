Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  get '/products/:litres' => 'products#index'
  root 'home#index'
end
