Rails.application.routes.draw do
  get 'admin_dashboard/index'
  resources :project_assignments
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users
  resources :projects
  resources :tasks do
    member do
      get :set_completed
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "user_sessions#new"
end
