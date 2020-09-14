Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  delete '/', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  namespace :users do
    resources :gardens do
      get '/plants/plot', to: 'plants#plot'
      put '/plants/increase', to: 'plants#increase'
      put '/plants/decrease', to: 'plants#decrease'
      resources :plants do
      end
    end
  end
end
