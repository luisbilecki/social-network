Rails.application.routes.draw do
  get 'users/index'

  #Devise
  devise_for :users, skip: [:sessions]
  as :user do
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session,
                   via: Devise.mappings[:user].sign_out_via
  end

  get 'home', to: 'home#index'
  get 'search', to: 'users#search'
  get '/users/showfollowing', to: 'users#showfollowing', as: 'showfollowing'
  get '/users/showfollowers', to: 'users#showfollowers', as: 'showfollowers'
  get '/users/follow/:id', to: 'followers#follow', as: 'follow'
  get '/users/unfollow/:id', to: 'followers#unfollow', as: 'unfollow'

  resources :posts, except: [:show]
  resources :users, only: [:update, :show]

  #Página inicial
  root 'home#index'
end
