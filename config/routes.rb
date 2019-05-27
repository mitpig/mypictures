Rails.application.routes.draw do
  root :to => "pictures#index"

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  resources :pictures, :only => [:index, :new, :create]
  get '/oauth/authenticate', :to => "oauth#authenticate"
  get '/oauth/callback', :to => "oauth#callback"
  get '/api/tweet/:id', :to => "oauth#tweet", as: 'tweet_api'
end
