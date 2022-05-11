Rails.application.routes.draw do
  resources :users, only: %i[index show]
  resources :registrations,
    controller: 'users/registrations',
    only: %i[new create edit update]
  resources :sessions,
    controller: 'users/sessions',
    only: %i[new create]

  get 'logout', to: 'users/sessions#destroy'
  root 'users#index'
end
