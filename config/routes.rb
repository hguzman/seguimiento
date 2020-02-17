Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
  end
  root to: 'home#index'

  devise_for :users
  get "home/index"

  # Crea un CRUD para novedades, sólo index, y new, si necesitamos CREATE and PUT, omitiríamos el only
  # resources :novedades, only: [:index, :new]
  resources :novedades

  resources :users
  resource :user, only: [:edit, :update]

end
