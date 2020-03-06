Rails.application.routes.draw do
  get 'comentarios/index'
  get 'comentarios/show'
  get 'comentarios/new'
  get 'comentarios/create'
   resources :anotaciones

  namespace :users do
    get 'anotaciones/index'
    get 'anotaciones/new'
  end
  devise_for :users
  root to: 'home#index'

  resources :especialidades
  resources :fichas

  get "toexcel", to: "fichas#toexcel"

  resources :users, only: [:index, :ver_user, :show] do
     get :ver_user, on: :member
   end
   resource :user, only: [:edit, :destroy, :update , :show] do
     collection do
       patch 'update_password'
       get :change_password
     end
   end

  end
