Rails.application.routes.draw do
  root to: "dashboard#index"

  namespace :api do
    namespace :v1 do
      resources :expenses, only: [:index, :create]
      resources :categories, only: [:index, :create, :update]
    end
  end
end
