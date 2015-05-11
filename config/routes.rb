Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  # static pages and information
  root        'static_pages#home'

  # registration/UX controller
  get         'register'  => 'registration#register'
  get         'profile'   => 'registration#profile'

  # admin controller
  resources   :courses


end
