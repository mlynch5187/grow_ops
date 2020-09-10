Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get '/user', to: 'users#show'

  delete '/', to: 'sessions#destroy'
end
