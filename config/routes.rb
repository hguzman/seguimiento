# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :ambientes
    resources :fichas
  end

  root to: 'home#index'

  resources :anotaciones, :especialidades, :fichas, :comentarios

  resources :ambientes, only: %i[index show] do
    resources :anotaciones, module: :ambientes
  end

  devise_for :users

  resources :users, only: %i[index show] do
    resources :anotaciones, module: :users
  end

  patch '/users/:id', to: 'users#update'

  get 'toexcel', to: 'fichas#toexcel'

  resource :user, only: %i[index edit destroy update show] do
    get :ver_user, on: :member
    collection do
      patch 'update_password'
      get :change_password
    end
  end
end
