Rails.application.routes.draw do

  # static pages and information
  root        'main#home'
  get         'groups'    => 'main#groups'
  get         'rentals'   => 'main#rentals'

  # courses
  resources   :courses
  get         'adult'     => 'courses#adult'
  get         'youth'     => 'courses#youth'
  get         'all'       => 'courses#all'

  # users
  resources   :users
  get         'signup'    => 'users#new'
  get         'login'     => 'sessions#new'
  post        'login'     => 'sessions#create'
  delete      'logout'    => 'sessions#destroy'

  # class list
  resources   :class_lists

  # password reset and account activation
  resources :account_activations, only: [:edit]


end
