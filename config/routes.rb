Women2::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :people
      resources :logins
    end
  end
  resources :people
  resources :search do
    post :create
    get :index
  end

  root :to => "people#index"

end
