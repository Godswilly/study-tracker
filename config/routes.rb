Rails.application.routes.draw do
  get 'levels/progress'
  resources :studies, except: [:index]

  get '/allData', to: 'studies#index'

  post '/signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
end
