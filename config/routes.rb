Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :edit, :update ]

  get :my_profile, to: 'users#my_profile'

  resources :vehicles, only: [:index, :show, :new, :create, :destroy] do
    resources :rentals, only: [:create]
  end

  resources :rentals, only: [:index, :show, :update, :destroy] do
    resources :vehicle_reviews, only: [:create]
  end

  get '/owner_dashboard', to: 'users#owner_dashboard'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
