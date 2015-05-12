Rails.application.routes.draw do


  # static pages and information
  root        'home#home'
  get         'lessons'   => 'home#lessons'
  get         'beginner'  => 'home#beginner'
  get         'intermed'  => 'home#intermediate'
  get         'advanced'  => 'home#advanced'
  get         'groups'    => 'home#groups'
  get         'rentals'   => 'home#rentals'
  get         'about'     => 'home#about'
  get         'weather'   => 'home#weather'

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
