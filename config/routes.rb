Rails.application.routes.draw do
  resources :reports
  resources :sale_details
  resources :sales
  resources :clients
  resources :products
  resources :product_lines
  resources :areas
  resources :branch_offices
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
