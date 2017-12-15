Rails.application.routes.draw do
  #Devise
  devise_for :users, skip: [:sessions]
  as :user do
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  get 'home', to: 'home#index'
  resources :posts, only: [:edit, :update, :new, :create ]

  #Página inicial
  root 'home#index'
end
