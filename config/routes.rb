Rails.application.routes.draw do
  root "sales#index"
  resources :sales, only: [:index] do
    collection do
      post :import
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
