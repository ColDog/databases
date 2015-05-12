Rails.application.routes.draw do

  # static pages and information
  root        'static_pages#home'

  # courses
  resources   :courses

  # users
  resources   :users
  get         'signup'    => 'users#new'
  get         'login'     => 'sessions#new'
  post        'login'     => 'sessions#create'
  delete      'logout'    => 'sessions#destroy'

  # class list
  resources   :class_lists


end
