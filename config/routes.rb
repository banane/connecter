Women2::Application.routes.draw do
  
  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :people

  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]

      resources :people

      resources :followed_people do
        collection do
          get :follows_me
        end
      end

      resources :logins do
        collection do
          get :event_info
        end
      end

      resources :search do
        post :create
        get :index
      end

    end
  end

  root :to => "api/v1/logins#index"

end
