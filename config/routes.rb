Rails.application.routes.draw do
  get '/products_filter' => 'products#filter'

  resources :products, only: [:index, :show]
  get '/products/:litres' => 'products#index'
  root 'home#index'
end
