Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  resources :words
  resources :etymons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'etymons#index'
end
