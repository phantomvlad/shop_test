Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json }do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :cards, only: [:index, :show]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
