Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json }do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :cards, only: [:index, :show]
      resources :shops, only: [:show, :update, :index, :create] do
        post 'buy', to: 'purchases#buy'
      end
    end
  end
end
