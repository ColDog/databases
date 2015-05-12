Rails.application.routes.draw do


  # static pages and information
  root        'main#home'
  get         'adult'     => 'main#adult'
  get         'youth'     => 'main#youth'
  get         'groups'    => 'main#groups'
  get         'rentals'   => 'main#rentals'

  # courses
  resources   :courses

  # users
  resources   :users
  get         'signup'    => 'users#new'
  get         'login'     => 'sessions#new'
  post        'login'     => 'sessions#create'
  delete      'logout'    => 'sessions#destroy'

  # class list
  resources   :class_lists, only: [:new, :create, :destroy, :update]


end
