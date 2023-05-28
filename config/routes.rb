Rails.application.routes.draw do
  post '/encode', to: 'urls#encode'
  get '/:short', to: 'urls#decode'

  #TODO: Make this private (not part of production env)
  # Default format of routes is JSON, since we are j. testing.
  namespace :test do
    resources :urls, only: [:index, :create, :destroy]
  end

  #TODO: set static route for root to home page?

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
