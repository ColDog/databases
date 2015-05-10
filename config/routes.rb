Rails.application.routes.draw do
  get 'registration/register'

  root        'static_pages#home'
  resources   :courses
  devise_for  :users
end
