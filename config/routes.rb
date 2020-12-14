Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/inbox" 

  devise_scope :user do
  root :to => "devise/sessions#new"
  end

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
        resources :boss_check_comments, only:[:new, :confirm] do
          collection do
           post :confirm
          end
            resources :sales_check_comments, only:[:new, :confirm] do
              collection do
                post :confirm
            end
         end
       end
     end
  end

  resources :detail_reports, only:[:index, :edit, :show, :update, :destroy, :create]


  resources :boss_check_comments, only:[:index, :edit, :show, :update, :destroy, :create]



  resources :sales_check_comments, only:[:index, :edit, :show, :update, :destroy, :create]



  get 'allsupports/index'
  get 'top/index'

end
