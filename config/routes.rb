Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only:[:index, :show]
  resources :customers do
    collection do
      post :confirm
    end
  end
end
