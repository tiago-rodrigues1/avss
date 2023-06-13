Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'home', to: 'home#index', as: 'home'

  devise_for :users
  resources :circuits

  resources :questions do
    post 'set_kind/:kind', on: :member, to: 'questions#set_kind', as: :set_kind
  end

  resources :stations do
    resources :questions do
      post :newq, on: :member, to: 'questions#new'
      #member do
      #  post :new, to: 'questions#new'
      #end
    end
  end

  resources :question_alternatives
  resources :questions do
    resources :question_alternatives do
      member do
        post :new
      end
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
