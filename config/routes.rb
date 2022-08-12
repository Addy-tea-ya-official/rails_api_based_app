Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resource :user
    end
  end

  namespace :api do
    namespace :v2 do
      resource :user
    end
  end

  api_version(:module => "api/V1", :header => {:name => "Accept", :value => "application/API_TRY; version=1"}) do
    resource :user
  end
  api_version(:module => "api/V2", :header => {:name => "Accept", :value => "application/API_TRY; version=2"}) do
    resource :user
  end
end
