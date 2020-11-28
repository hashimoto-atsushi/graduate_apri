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

  resources :support_programs do
    collection do
      post :confirm
    end
    resources :detail_reports, only:[:new, :confirm] do
      collection do
        post :confirm
      end
    end
  end

  resources :detail_reports, only:[:index, :edit, :show, :update, :destroy, :create]


  resources :boss_check_comments do
    collection do
      post :confirm
    end
  end

  resources :sales_check_comments do
    collection do
      post :confirm
    end
  end


  get 'allsupports/index'
  get 'top/index'

end
