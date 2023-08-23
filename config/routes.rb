Rails.application.routes.draw do
  devise_for :users
  root to: "supports#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resouces :medicines, only: [] do
    resources :records, only: [:new, :create]
  end
  resources :supports, only: [:index, :show] do
    resources :medicines
    resources :appointments
  end
  resources :health_records, only: [:new, :create]
  get "/overviews", to: "users#overview", as: :overviews
end
