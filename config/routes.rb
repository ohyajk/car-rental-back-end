Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post "/auth/login", to: "authentication#login"
  resources :users

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy]
      resources :cars
    end
  end
  root to: redirect("/api-docs", status: 302)

  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#create'
end
