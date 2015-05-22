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
  get         'admin/home'      => 'admin#home'
  post        'admin/user'      => 'admin#create_user'
  get         'admin/class'     => 'admin#new_class'
  post        'admin/class'     => 'admin#create_class_list'
  post        'admin/wait'      => 'admin#create_wait_list'

  # password reset and account activation
  resources   :account_activations, only: [:edit]
  resources   :password_resets,     only: [:new, :create, :edit, :update]


end
