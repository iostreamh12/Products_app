Rel::Application.routes.draw do
  get 'products/index'

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "product", to: "products#new", as: "product"
  get "index", to: "products#index", as: "index"
  resources :products
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
    resources :products
  end
  
end
