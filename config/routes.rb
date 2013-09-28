Women2::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :people
      resources :login
    end
  end
  resources :people
  resources :search do
    post :create
    get :index
  end
  resources :login

  root :to => "people#index"

end
