Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

  namespace :api do
    namespace :v1 do
      resources :destinations, only: [:index, :show, :create, :update, :destroy] do
      end
    end
  end
end
