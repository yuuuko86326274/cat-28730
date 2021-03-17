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
  devise_scope :personal do
    post 'personals/guest_sign_in', to: 'personals/sessions#new_guest'
  end
  devise_scope :trader do
    post 'traders/guest_sign_in', to: 'traders/sessions#new_guest'
  end
  root to: 'cats#index'
  # resources :users, only: [:new, :create, :destroy]
  resources :cats do
    resources :families, only: [:index, :new, :create]
  end
  
  resources :traders, only: :show
  resources :personals, only: :show
end
