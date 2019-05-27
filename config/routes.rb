Rails.application.routes.draw do
  root :to => "pictures#index"

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  resources :pictures, :only => [:index, :new, :create]
end
