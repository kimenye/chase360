Chase360::Application.routes.draw do

  ActiveAdmin.routes(self)
  
  match 'verify', to: 'sessions#create', as: 'verify', via: "post"
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'summary', to: 'companies#summary', as: 'company_summary'
  get 'company/:id/users', to:'users#relationship_officers',as:'relationship_officers'
  get 'users/:id/feed', to: 'users#feed'  
  # root to: "admin/dashboard#index"
  get '/admin', to: 'admin/dashboard#index'
  
  post "users/:id", to: 'users#update', as: 'update_user'
  post "leads/:id", to: 'leads#close', as: 'close_lead'

  root to: "home#index"

  resources :companies, :leads, :users, :departments

  # devise_for :users, :controllers => { :omniauth_callbacks => "auth/omniauth_callbacks" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
end
