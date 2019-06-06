Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'bands#index'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: :index
  end

  resources :albums do
    resources :tracks, only: :index
  end

  resources :tracks

end
