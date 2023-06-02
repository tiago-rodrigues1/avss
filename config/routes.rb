Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'home', to: 'home#index', as: 'home'

  devise_for :users
  resources :circuits
  resources :questions
  resources :stations do
    resources :questions do
      post :newq, on: :member, to: 'questions#new'
    end
  end

  post 'search', to: 'circuits#search'
  # get 'circuits/new', to: 'circuits#new'
  # get 'circuits', to: 'circuits#index'
  # post 'circuits', to: 'circuits#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
