Rails.application.routes.draw do
  get 'home', to: 'home#index'
  #Página inicial
  root 'home#index'
end
