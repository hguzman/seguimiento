Rails.application.routes.draw do
  resources :ambientes
  root to: 'home#index'
  get 'comentarios/index'
  get 'comentarios/show'
  get 'comentarios/new'
  get 'comentarios/create'
   resources :anotaciones


  devise_for :users

  resources :users, only: [:index, :show] do
    resources :anotaciones, module: :users
  end

  resources :especialidades
  resources :fichas

  get "toexcel", to: "fichas#toexcel"


   resource :user, only: [:index, :edit, :destroy, :update , :show] do
     get :ver_user, on: :member
     collection do
       patch 'update_password'
       get :change_password
     end
   end

  end
