Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :reports
  resources :sales do 
    resources :sale_details
  end


  resources :product_lines
  resources :clients
  
  resources :branch_offices do
    resources :areas
    resources :products
    resources :employees  
  end

  resources :managers do
    collection do
      get  :new_manager
      post :create_manager
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
