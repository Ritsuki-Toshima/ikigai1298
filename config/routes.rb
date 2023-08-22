Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :medicines, only: [:index, :new, :create] do
    resources :records, only: [:new, :create]
  end
  resources :supports, only: [:index, :show] do
    resources :medicines, only: [:edit, :update]
  end

  resources :appointments, only:  [:new, :create]
  resources :health_records, only: [:new, :create]
  get "/overviews", to: "users#overview", as: :overviews
end
