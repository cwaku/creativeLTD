Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:index, :show, :new, :edit]
  resources :events
  resources :venues
  resources :bookings
  resources :equipments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
