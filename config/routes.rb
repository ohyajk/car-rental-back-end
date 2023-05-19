Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post "/auth/login", to: "authentication#login"
  
  resources :users
  resources :reservations, only: [:index, :create, :destroy]
  resources :cars, only: [:index]
  root to: redirect("/api-docs", status: 302)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
