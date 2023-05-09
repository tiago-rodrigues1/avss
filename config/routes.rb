Rails.application.routes.draw do
  get 'home/index'

  resources :circuits
  # get 'circuits/new', to: 'circuits#new'
  # get 'circuits', to: 'circuits#index'
  # post 'circuits', to: 'circuits#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
