Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users
  get "home/index"

  # Crea un CRUD para novedades, sólo index, y new, si necesitamos CREATE and PUT, omitiríamos el only
  # resources :novedades, only: [:index, :new]
  resources :novedades
  resources :users

end
