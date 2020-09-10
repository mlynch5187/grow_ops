Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')


  delete '/', to: 'sessions#destroy'

  # get '/user/gardens/new', to: 'gardens#new'
  # post '/user/gardens', to: 'gardens#create'

  namespace :users do
    get '/show', to: 'users#show'
    resources :gardens
  end
end
