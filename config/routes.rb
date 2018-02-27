Rails.application.routes.draw do
  resources :words
  resources :etymons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'etymons#index'
end
