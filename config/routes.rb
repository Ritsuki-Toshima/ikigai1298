Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users
  root to: "supports#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :medicines, only: [] do
    resources :reminders, only: [:new, :create]
  end
  resources :supports, only: [:index, :show] do
    resources :medicines
    resources :appointments
  end
  resources :health_records, only: [:new, :create]
  resources :reminders, only: [:edit, :create]
  get "/overviews", to: "users#overview", as: :overviews
  resources :notifications, only: [:index, :show]
end
