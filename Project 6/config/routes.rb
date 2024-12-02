Rails.application.routes.draw do
  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Define root path route
  root "login#index" # The root route for login

  # Authentication routes
  get '/login', to: 'sessions#new', as: :login    # Login page
  post '/login', to: 'sessions#create'            # Login action
  delete '/logout', to: 'sessions#destroy', as: :logout # Logout action

  # Account creation (Signup) - optional, depending on your needs
  get '/create_account', to: 'users#new', as: :signup
  post '/create_account', to: 'users#create'

  # Role-based presentation routes
  get '/presentations', to: 'presentations#index', as: :student_presentations  # Student presentations
  get '/presentations/ta', to: 'presentations#index_ta', as: :ta_presentations  # TA presentations

  # Role-based evaluation routes
  get '/evaluations', to: 'evaluations#index', as: :student_evaluations  # Student evaluations
  get '/evaluations/ta', to: 'evaluations#index_ta', as: :ta_evaluations  # TA evaluations

  # Add a dashboard for role-specific redirection
  get '/dashboard', to: 'dashboard#index', as: :dashboard
end
