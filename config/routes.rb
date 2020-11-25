Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :users, only:[:index, :show]

  resources :products do
    collection do
      post :confirm
    end
  end

  resources :customers do
    collection do
      post :confirm
    end
  end

  resources :parts do
    collection do
      post :confirm

    end
  end
  resources :installed_products do
    collection do
      post :confirm
    end
  end
end
