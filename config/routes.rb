Rails.application.routes.draw do
  resources :station_submissions
  resources :circuit_submissions
  resources :circuit_applications
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'home', to: 'home#index', as: 'home'

  devise_for :users
  resources :circuits do
    resources :circuit_applications
  end

  resources :circuit_applications do
    resources :circuit_submissions
  end


  resources :questions do
    patch 'set_kind', on: :member, to: 'questions#set_kind', as: :set_kind
  end

  resources :stations

  delete 'foobar/:attachment_id', to: 'stations#remove_attachment', as: 'ftest'

  resources :question_alternatives

  post 'questions/:id/new_alternative', to: 'questions#new_alternative', as: 'new_alternative'
  post 'circuits/:id/add_station/:station_id', to: 'circuits#add_station', as: 'add_station_to_circuit'
  delete 'circuits/:id/remove_station/:station_id', to: 'circuits#remove_station', as: 'remove_station_from_circuit'

  post 'stations/:station_id/new_question', to: 'stations#new_question', as: 'new_station_question'
  delete 'stations/:station_id/question/:question_id', to: 'stations#remove_question', as: 'remove_station_question'
  delete 'questions/:question_id/remove_alternative/:id', to: 'questions#remove_alternative', as: 'remove_alternative'

  post 'station/:id/difficulty/:value', to: 'stations#set_station_difficulty', as: 'set_station_difficulty'
  post 'search', to: 'circuits#search'

  post 'circuit_submissions/:circuit_submission_id/station_submission/:station_id/new', to: 'station_submissions#create_submission_for_circuit', as: 'create_station_submission_for_circuit'
  post 'create_application/:circuit_id', to: 'circuit_applications#create_application', as: 'create_application'

  get 'circuits/:id/add_stations', to: 'circuits#add_stations_index', as: 'add_stations_index'
  # get 'circuits/new', to: 'circuits#new'
  # get 'circuits', to: 'circuits#index'
  # post 'circuits', to: 'circuits#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
