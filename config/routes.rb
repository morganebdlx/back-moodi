Rails.application.routes.draw do
    devise_for :users

  get "/weather", to: "weather#show"
  get "/ping", to: "application#ping"

  resources :users, only: [:index, :show, :create, :update, :destroy]
  post "/recommendations", to: "recommendations#create"

  namespace :api do
    post '/login', to: 'sessions#create'
    delete "/logout", to: "sessions#destroy"
    get '/current_user', to: 'sessions#show'


    # Exemple : Ajouter d'autres endpoints d'API ici
    # get "/user_data", to: "users#data"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
