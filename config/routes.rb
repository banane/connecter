Women2::Application.routes.draw do
  devise_for :users
  resources :user

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :followed_people do
        collection do
          get :follows_me
        end
      end
      resources :logins
      resources :people
      resources :search do
        post :create
        get :index
      end
    end
  end

  root :to => "api/v1/logins#index"

end
