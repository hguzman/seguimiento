Rails.application.routes.draw do

  resources :especialidades
  resources :fichas
  root to: 'home#index'
  end