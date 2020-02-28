Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :especialidades
  resources :fichas

  get "toexcel", to: "fichas#toexcel"

  resources :users, only: [:index, :ver_user] do
     get :ver_user, on: :member
   end

   resource :user, only: [:edit, :destroy, :update , :show] do
     collection do
       patch 'update_password'
       get :change_password
     end
   end

  end
