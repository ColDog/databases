Rails.application.routes.draw do

  # static pages and information
  root        'main#home'

  # courses
  resources   :courses
  get           'all'           => 'courses#all'

  # users
  resources   :users
  get         'signup'          => 'users#new'
  get         'login'           => 'sessions#new'
  post        'login'           => 'sessions#create'
  delete      'logout'          => 'sessions#destroy'

  # class list
  resources   :class_lists
  resources   :wait_lists

  # create users from admin panel
  get         'admin_user'      => 'admin#new_user'
  post        'admin_user'      => 'admin#create_user'
  get         'admin_class'     => 'admin#new_class'
  post        'admin_class'     => 'admin#create_class_list'
  post        'admin_wait'      => 'admin#create_wait_list'

  # password reset and account activation
  resources   :account_activations, only: [:edit]
  resources   :password_resets,     only: [:new, :create, :edit, :update]


end
