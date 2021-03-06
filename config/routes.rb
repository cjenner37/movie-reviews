Rails.application.routes.draw do

  get 'creators/index'

  get 'creators/show'

  devise_for :users, controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
  }

  root 'home#index'

  resources :reviews
  resources :movies
  resources :viewings

  resources :users, only: [:index, :show]

end
