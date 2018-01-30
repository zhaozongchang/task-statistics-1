Rails.application.routes.draw do
  devise_for :users
  resources :tasks

  namespace :admin do
    resources :tasks
  end
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
