Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'levels/progress'
      resources :studies, except: [:index]

      get '/allStudies', to: 'studies#index'

      post '/signup', to: 'users#create'
      post 'auth/login', to: 'authentication#authenticate'
    end
  end
end
