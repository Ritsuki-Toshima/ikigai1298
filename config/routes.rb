Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[show edit update]

  get '/search_elderlies', to: 'supports#search_elderlies'

  resources :supports, only: [:new, :create]

  resources :supports, only: [:index, :show] do
    resources :medicines
    resources :appointments
  end

  resources :medicines, only: [:update] do
    resources :reminders, only: [:new, :create] do
      member do
        post :send_sms
      end
    end
  end


  resources :appointments, only: [:index, :show]
  resources :health_records
  resources :medicines, only: [:index]
  resources :reminders, only: [:edit, :create]

  get "/overviews", to: "users#overview", as: :overviews

  resources :notifications, only: [:index, :show, :new, :create]
  get "/pages", to: "pages#home"
end
