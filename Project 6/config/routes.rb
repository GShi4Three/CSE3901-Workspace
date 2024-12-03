Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # Routes for Users
      resources :users, only: [:index, :show, :create]
      # Routes for Evaluations (Nested under Presentations)
      resources :presentations do
        resources :evaluations, only: [:index, :show, :create]
      end
    end
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  resources :presentations, only: [:new, :create]

  # Defines the root path route ("/")
  root "login#index"

  post '/login', to: 'sessions#create'

  get '/create_account', to: 'login#index_create' # Route for the TA presentations page

  get '/presentations/ta', to: 'presentations#index_ta' # Route for the TA presentations page

  get '/presentations/new', to: 'presentations#new' # Route for the TA presentations page

  get '/presentations', to: 'presentations#index' # Route for the student presentations page

  get '/evaluations', to: 'evaluations#index' # Route for the student evaluations page

  get '/evaluations/ta', to: 'evaluations#index_ta' # Route for the student evaluations page

  get '/roster', to: 'roster#index'

  patch '/roster/:id/role', to: 'roster#update_role', as: 'update_user_role'

  delete '/roster/:id', to: 'roster#destroy', as: 'delete_user'

end
