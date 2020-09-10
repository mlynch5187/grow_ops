Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')


  delete '/', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'

  namespace :users do
    resources :gardens
  end
end
