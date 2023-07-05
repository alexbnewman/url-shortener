Rails.application.routes.draw do

  # Defines the root path route ("/")
  root 'pages#enter'
  get '/home', to: 'pages#home'
  get '/shortened', to: 'pages#shortened'

  post '/encode', to: 'urls#encode'
  get '/:short', to: 'urls#decode'

  #TODO: Make this private (not part of production env)
  # Default format of routes is JSON, since we are j. testing.
  namespace :test do
    resources :urls, only: [:index, :create, :destroy] do
      collection do
        delete '/destroy_range', to: 'urls#destroy_range'
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
