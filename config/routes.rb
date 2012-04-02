College::Application.routes.draw do
  
  root to: 'pages#index'

  get 'login' , to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :sessions
  resources :users do
    member do
      resources :subjects
      resources :schedules
    end
  end
end