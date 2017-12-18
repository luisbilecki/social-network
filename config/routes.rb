Rails.application.routes.draw do
  #Errors
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

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
  put 'like/:id', to: 'posts#like', as: 'like'

  resources :posts, except: [:show]
  resources :comments, except: [:show]
  resources :users, only: [:update, :show]
  resources :events, except: [:show]

  #Página inicial
  root 'home#index'
end
