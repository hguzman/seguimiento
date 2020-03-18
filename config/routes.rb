Rails.application.routes.draw do
  root to: 'home#index'

  resources :ambientes, :anotaciones, :especialidades, :fichas, :comentarios

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :anotaciones, module: :users
  end

  patch "/users/:id", to: "users#update"

  get "toexcel", to: "fichas#toexcel"


   resource :user, only: [:index, :edit, :destroy, :update , :show] do
     get :ver_user, on: :member
     collection do
       patch 'update_password'
       get :change_password
     end
   end

  end
