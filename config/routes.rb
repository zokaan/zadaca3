Rails.application.routes.draw do
  root "home#index"

  # get '/test', controller: 'home', action: 'test'
  # get '/test' => 'home#test', as: 'nesto'
  get '/test' => 'home#test'
  # get '/about' => 'static_pages#about'
  # get '/products' => 'home#products'

  resource :about, only: [:show]
  resources :products
  resources :sellers
  resources :categories
  # resources :products, only: [:index, :edit, :show]
  # resources :products, except: [:index]
end
