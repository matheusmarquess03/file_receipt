Rails.application.routes.draw do
  devise_for :users

  root "sales#index"
  resources :sales, only: [:index] do
    collection do
      post :import
    end
  end
end
