Women2::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :people
      resources :logins
      resources :followed_people do
        collection do
          get :follows_me
        end
      end
      resources :search do
        post :create
        get :index
      end
      end
  end


  root :to => "people#index"

end
