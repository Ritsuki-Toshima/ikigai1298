Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users
  root to: "supports#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :supports, only: [:index, :show] do
    resources :medicines
    resources :appointments
  end

  resources :medicines, only: [:update] do
    resources :reminders, only: [:new, :create]
  end

  resources :appointments, only: [:index, :show]
  resources :health_records
  resources :medicines, only: [:index]
  resources :reminders, only: [:edit, :create]

  get "/overviews", to: "users#overview", as: :overviews

  resources :notifications, only: [:index, :show, :new, :create]
  get "/pages", to: "pages#home"
end
