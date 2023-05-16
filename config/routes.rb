Rails.application.routes.draw do
  resources :questions
  resources :stations
  get 'home/index'
  get 'teste', to: 'questions#teste', as: 'test'
  get 'teste1', to: 'questions#teste1', as: 'test1'
  get 'teste2', to: 'questions#teste2', as: 'test2'

  resources :circuits

  post 'search', to: 'circuits#search'
  # get 'circuits/new', to: 'circuits#new'
  # get 'circuits', to: 'circuits#index'
  # post 'circuits', to: 'circuits#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
