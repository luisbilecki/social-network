Rails.application.routes.draw do
  #Devise
  devise_for :users

  get 'home', to: 'home#index'
  #Página inicial
  root 'home#index'
end
