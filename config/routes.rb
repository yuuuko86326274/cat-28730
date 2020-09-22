Rails.application.routes.draw do
  get 'traders/show'
  get 'personals/show'
  devise_for :personals, controllers:{
    sessions:      'personals/sessions',
    passwords:     'personals/passwords',
    registrations: 'personals/registrations'
  }
  devise_for :traders, controllers:{
    sessions:      'traders/sessions',
    passwords:     'traders/passwords',
    registrations: 'traders/registrations'
  }
  root to: 'cats#index'
  # resources :users, only: [:new, :create, :destroy]
  resources :cats
  resources :traders, only: :show
  resources :personals, only: :show
end
