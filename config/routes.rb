Rails.application.routes.draw do

  # get 'especialidades/index'
  # get 'especialidades/create'
  # get 'especialidades/edit'
  # get 'especialidades/update'
  # get 'especialidades/show'
  # get 'especialidad/index'
  # get 'especialidad/create'
  # get 'especialidad/edit'
  # get 'especialidad/update'
  # get 'especialidad/show'
  # get "home/index"
  # get "home/minor"
  
  resources :especialidades
  
  root to: 'home#index'
  
  end