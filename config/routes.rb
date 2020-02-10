Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  get "home/index"
  get "home/minor"
  get "novedad/index"

end
