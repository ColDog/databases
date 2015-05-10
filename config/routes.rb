Rails.application.routes.draw do

  # static pages and information
  root        'static_pages#home'

  # registration/UX controller
  get         'register'  => 'registration#register'
  get         'profile'   => 'registration#profile'

  # admin controller
  resources   :courses

  # users devise
  devise_for  :users
end
