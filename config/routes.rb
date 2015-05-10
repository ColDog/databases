Rails.application.routes.draw do
  root        'static_pages#home'
  resources   :courses
  devise_for  :users
end
