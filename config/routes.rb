Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'home', to: 'home#index', as: 'home'

  devise_for :users
  resources :circuits

  resources :questions do
    patch 'set_kind', on: :member, to: 'questions#set_kind', as: :set_kind
  end

  resources :stations

  delete 'foobar/:attachment_id', to: 'stations#remove_attachment', as: 'ftest'

  resources :question_alternatives

  post 'questions/:id/new_alternative', to: 'questions#new_alternative', as: 'new_alternative'

  post 'stations/:station_id/new_question', to: 'stations#new_question', as: 'new_station_question'
  delete 'stations/:station_id/question/:question_id', to: 'stations#remove_question', as: 'remove_station_question'
  delete 'questions/:question_id/remove_alternative/:id', to: 'questions#remove_alternative', as: 'remove_alternative'

  post 'station/:id/difficulty/:value', to: 'stations#set_station_difficulty', as: 'set_station_difficulty'
  post 'search', to: 'circuits#search'
  # get 'circuits/new', to: 'circuits#new'
  # get 'circuits', to: 'circuits#index'
  # post 'circuits', to: 'circuits#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
