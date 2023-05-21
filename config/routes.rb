Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post "/auth/login", to: "authentication#login"
  resources :users
  
  resources :reservations, only: [:index, :create, :destroy]
  resources :cars
  root to: redirect("/api-docs", status: 302)

end
