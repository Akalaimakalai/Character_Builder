Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

  resources :users, only: :show

  resources :characters, only: %i[ index show new create ]
end
